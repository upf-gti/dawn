// Copyright 2022 The Dawn & Tint Authors
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived from
//    this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#include "dawn/native/ApplyClearColorValueWithDrawHelper.h"

#include <limits>
#include <string>
#include <utility>

#include "dawn/common/Enumerator.h"
#include "dawn/common/Range.h"
#include "dawn/native/BindGroup.h"
#include "dawn/native/BindGroupLayout.h"
#include "dawn/native/Buffer.h"
#include "dawn/native/CommandEncoder.h"
#include "dawn/native/Device.h"
#include "dawn/native/InternalPipelineStore.h"
#include "dawn/native/ObjectContentHasher.h"
#include "dawn/native/RenderPassEncoder.h"
#include "dawn/native/RenderPipeline.h"
#include "dawn/native/utils/WGPUHelpers.h"
#include "dawn/native/webgpu_absl_format.h"

namespace dawn::native {

namespace {

// General helper functions and data structures for applying clear values with draw
static const char kVSSource[] = R"(
@vertex
fn main(@builtin(vertex_index) vertexIndex : u32) -> @builtin(position) vec4f {
    var pos = array(
        vec2f(-1.0, -1.0),
        vec2f( 3.0, -1.0),
        vec2f(-1.0,  3.0));
    return vec4f(pos[vertexIndex], 0.0, 1.0);
})";

const char* GetTextureComponentTypeString(DeviceBase* device, wgpu::TextureFormat format) {
    DAWN_ASSERT(format != wgpu::TextureFormat::Undefined);

    const Format& formatInfo = device->GetValidInternalFormat(format);
    switch (formatInfo.GetAspectInfo(Aspect::Color).baseType) {
        case TextureComponentType::Sint:
            return "i32";
        case TextureComponentType::Uint:
            return "u32";
        case TextureComponentType::Float:
            return "f32";
    }
    DAWN_UNREACHABLE();
}

// Construct the fragment shader to apply the input color values to the corresponding color
// attachments of KeyOfApplyClearColorValueWithDrawPipelines.
std::string ConstructFragmentShader(DeviceBase* device,
                                    const KeyOfApplyClearColorValueWithDrawPipelines& key) {
    std::ostringstream outputColorDeclarationStream;
    std::ostringstream clearValueUniformBufferDeclarationStream;
    std::ostringstream assignOutputColorStream;

    outputColorDeclarationStream << "struct OutputColor {\n";
    clearValueUniformBufferDeclarationStream << "struct ClearColors {\n";

    // Only generate the assignments we need.
    for (auto i : IterateBitSet(key.colorTargetsToApplyClearColorValue)) {
        wgpu::TextureFormat currentFormat = key.colorTargetFormats[i];
        DAWN_ASSERT(currentFormat != wgpu::TextureFormat::Undefined);

        const char* type = GetTextureComponentTypeString(device, currentFormat);

        outputColorDeclarationStream
            << absl::StrFormat("    @location(%u) output%u : vec4<%s>,\n", i, i, type);
        clearValueUniformBufferDeclarationStream
            << absl::StrFormat("    color%u : vec4<%s>,\n", i, type);
        assignOutputColorStream << absl::StrFormat(
            "    outputColor.output%u = clearColors.color%u;\n", i, i);
    }
    outputColorDeclarationStream << "}\n";
    clearValueUniformBufferDeclarationStream << "}\n";

    std::ostringstream fragmentShaderStream;
    fragmentShaderStream << outputColorDeclarationStream.str()
                         << clearValueUniformBufferDeclarationStream.str() << R"(
@group(0) @binding(0) var<uniform> clearColors : ClearColors;

@fragment
fn main() -> OutputColor {
    var outputColor : OutputColor;
)" << assignOutputColorStream.str()
                         << R"(
    return outputColor;
})";
    return fragmentShaderStream.str();
}

RenderPipelineBase* GetCachedPipeline(InternalPipelineStore* store,
                                      const KeyOfApplyClearColorValueWithDrawPipelines& key) {
    auto iter = store->applyClearColorValueWithDrawPipelines.find(key);
    if (iter != store->applyClearColorValueWithDrawPipelines.end()) {
        return iter->second.Get();
    }
    return nullptr;
}

ResultOrError<RenderPipelineBase*> GetOrCreateApplyClearValueWithDrawPipeline(
    DeviceBase* device,
    const KeyOfApplyClearColorValueWithDrawPipelines& key) {
    InternalPipelineStore* store = device->GetInternalPipelineStore();
    RenderPipelineBase* cachedPipeline = GetCachedPipeline(store, key);
    if (cachedPipeline != nullptr) {
        return cachedPipeline;
    }

    // Prepare the vertex stage
    Ref<ShaderModuleBase> vertexModule;
    DAWN_TRY_ASSIGN(vertexModule, utils::CreateShaderModule(device, kVSSource));
    VertexState vertex = {};
    vertex.module = vertexModule.Get();
    vertex.entryPoint = "main";

    // Prepare the fragment stage
    std::string fragmentShader = ConstructFragmentShader(device, key);
    Ref<ShaderModuleBase> fragmentModule;
    DAWN_TRY_ASSIGN(fragmentModule, utils::CreateShaderModule(device, fragmentShader.c_str()));
    FragmentState fragment = {};
    fragment.module = fragmentModule.Get();
    fragment.entryPoint = "main";

    // Prepare the color states
    PerColorAttachment<ColorTargetState> colorTargets = {};
    for (auto [i, target] : Enumerate(colorTargets)) {
        target.format = key.colorTargetFormats[i];
        // We shouldn't change the color targets that are not involved in.
        if (!key.colorTargetsToApplyClearColorValue[i]) {
            target.writeMask = wgpu::ColorWriteMask::None;
        }
    }

    // Create RenderPipeline
    RenderPipelineDescriptor renderPipelineDesc = {};

    renderPipelineDesc.vertex = vertex;
    renderPipelineDesc.fragment = &fragment;
    renderPipelineDesc.multisample.count = key.sampleCount;
    DepthStencilState depthStencilState = {};
    depthStencilState.depthWriteEnabled = false;
    if (key.depthStencilFormat != wgpu::TextureFormat::Undefined) {
        depthStencilState.format = key.depthStencilFormat;
        renderPipelineDesc.depthStencil = &depthStencilState;
    }
    fragment.targetCount = key.colorAttachmentCount;
    fragment.targets = colorTargets.data();

    Ref<RenderPipelineBase> pipeline;
    DAWN_TRY_ASSIGN(pipeline, device->CreateRenderPipeline(&renderPipelineDesc));
    store->applyClearColorValueWithDrawPipelines.emplace(key, std::move(pipeline));

    return GetCachedPipeline(store, key);
}

Color GetClearColorValue(const RenderPassColorAttachment& attachment) {
    return attachment.clearValue;
}

ResultOrError<Ref<BufferBase>> CreateUniformBufferWithClearValues(
    CommandEncoder* encoder,
    const RenderPassDescriptor* renderPassDescriptor,
    const KeyOfApplyClearColorValueWithDrawPipelines& key) {
    auto colorAttachments = ityp::SpanFromUntyped<ColorAttachmentIndex>(
        renderPassDescriptor->colorAttachments, renderPassDescriptor->colorAttachmentCount);

    std::array<uint8_t, sizeof(uint32_t) * 4 * kMaxColorAttachments> clearValues = {};
    uint32_t offset = 0;
    for (auto i : IterateBitSet(key.colorTargetsToApplyClearColorValue)) {
        const Format& format = colorAttachments[i].view->GetFormat();
        TextureComponentType baseType = format.GetAspectInfo(Aspect::Color).baseType;

        Color initialClearValue = GetClearColorValue(colorAttachments[i]);
        Color clearValue = ClampClearColorValueToLegalRange(initialClearValue, format);
        switch (baseType) {
            case TextureComponentType::Uint: {
                uint32_t* clearValuePtr = reinterpret_cast<uint32_t*>(clearValues.data() + offset);
                clearValuePtr[0] = static_cast<uint32_t>(clearValue.r);
                clearValuePtr[1] = static_cast<uint32_t>(clearValue.g);
                clearValuePtr[2] = static_cast<uint32_t>(clearValue.b);
                clearValuePtr[3] = static_cast<uint32_t>(clearValue.a);
                break;
            }
            case TextureComponentType::Sint: {
                int32_t* clearValuePtr = reinterpret_cast<int32_t*>(clearValues.data() + offset);
                clearValuePtr[0] = static_cast<int32_t>(clearValue.r);
                clearValuePtr[1] = static_cast<int32_t>(clearValue.g);
                clearValuePtr[2] = static_cast<int32_t>(clearValue.b);
                clearValuePtr[3] = static_cast<int32_t>(clearValue.a);
                break;
            }
            case TextureComponentType::Float: {
                float* clearValuePtr = reinterpret_cast<float*>(clearValues.data() + offset);
                clearValuePtr[0] = static_cast<float>(clearValue.r);
                clearValuePtr[1] = static_cast<float>(clearValue.g);
                clearValuePtr[2] = static_cast<float>(clearValue.b);
                clearValuePtr[3] = static_cast<float>(clearValue.a);
                break;
            }
        }
        offset += sizeof(uint32_t) * 4;
    }

    DAWN_ASSERT(offset > 0);

    Ref<BufferBase> buffer;
    DAWN_TRY_ASSIGN(buffer, encoder->GetDevice()->GetOrCreateTemporaryUniformBuffer(offset));
    buffer->SetLabel("Internal_UniformClearValues");
    encoder->APIWriteBuffer(buffer.Get(), 0, clearValues.data(), offset);

    return std::move(buffer);
}

bool NeedsBigIntClear(const RenderPassColorAttachment& colorAttachmentInfo) {
    // We should only apply this workaround on 32-bit signed and unsigned integer formats.
    const Format& format = colorAttachmentInfo.view->GetFormat();
    switch (format.format) {
        case wgpu::TextureFormat::R32Sint:
        case wgpu::TextureFormat::RG32Sint:
        case wgpu::TextureFormat::RGBA32Sint:
        case wgpu::TextureFormat::R32Uint:
        case wgpu::TextureFormat::RG32Uint:
        case wgpu::TextureFormat::RGBA32Uint:
            break;
        default:
            return false;
    }

    Color clearValue = GetClearColorValue(colorAttachmentInfo);
    std::array<double, 4> clearValueInArray = {
        {clearValue.r, clearValue.g, clearValue.b, clearValue.a}};
    for (uint8_t i = 0; i < format.componentCount; ++i) {
        double value = clearValueInArray[i];
        switch (format.GetAspectInfo(Aspect::Color).baseType) {
            case TextureComponentType::Uint: {
                constexpr double kMaxUintRepresentableInFloat =
                    1 << std::numeric_limits<float>::digits;
                if (value > kMaxUintRepresentableInFloat) {
                    return true;
                }
                break;
            }
            case TextureComponentType::Sint: {
                constexpr double kMaxSintRepresentableInFloat =
                    1 << std::numeric_limits<float>::digits;
                constexpr double kMinSintRepresentableInFloat = -kMaxSintRepresentableInFloat;
                if (value > kMaxSintRepresentableInFloat || value < kMinSintRepresentableInFloat) {
                    return true;
                }
                break;
            }
            case TextureComponentType::Float:
                DAWN_UNREACHABLE();
                return false;
        }
    }

    return false;
}

bool GetKeyOfApplyClearColorValueWithDrawPipelines(
    const DeviceBase* device,
    const RenderPassDescriptor* renderPassDescriptor,
    KeyOfApplyClearColorValueWithDrawPipelines* key) {
    bool clearWithDraw = device->IsToggleEnabled(Toggle::ClearColorWithDraw);
    bool clearWithDrawForBigInt =
        device->IsToggleEnabled(Toggle::ApplyClearBigIntegerColorValueWithDraw);

    if (!clearWithDraw && !clearWithDrawForBigInt) {
        return false;
    }

    key->colorAttachmentCount = renderPassDescriptor->colorAttachmentCount;

    auto colorAttachments = ityp::SpanFromUntyped<ColorAttachmentIndex>(
        renderPassDescriptor->colorAttachments, renderPassDescriptor->colorAttachmentCount);

    key->colorTargetFormats.fill(wgpu::TextureFormat::Undefined);
    for (auto [i, attachment] : Enumerate(colorAttachments)) {
        if (attachment.view == nullptr) {
            continue;
        }

        key->colorTargetFormats[i] = attachment.view->GetFormat().format;
        if (key->sampleCount == 0) {
            key->sampleCount = attachment.view->GetTexture()->GetSampleCount();
        } else {
            DAWN_ASSERT(key->sampleCount == attachment.view->GetTexture()->GetSampleCount());
        }

        if (attachment.loadOp != wgpu::LoadOp::Clear) {
            continue;
        }

        if (clearWithDraw || (clearWithDrawForBigInt && NeedsBigIntClear(attachment))) {
            key->colorTargetsToApplyClearColorValue.set(i);
        }
    }

    if (renderPassDescriptor->depthStencilAttachment &&
        renderPassDescriptor->depthStencilAttachment->view != nullptr) {
        key->depthStencilFormat =
            renderPassDescriptor->depthStencilAttachment->view->GetFormat().format;
    }

    if (key->colorTargetsToApplyClearColorValue.none()) {
        return false;
    }

    return true;
}

}  // namespace

size_t KeyOfApplyClearColorValueWithDrawPipelinesHashFunc::operator()(
    KeyOfApplyClearColorValueWithDrawPipelines key) const {
    size_t hash = 0;

    HashCombine(&hash, key.colorAttachmentCount);

    HashCombine(&hash, key.colorTargetsToApplyClearColorValue);

    for (wgpu::TextureFormat format : key.colorTargetFormats) {
        HashCombine(&hash, format);
    }

    HashCombine(&hash, key.sampleCount);

    HashCombine(&hash, key.depthStencilFormat);

    return hash;
}

bool KeyOfApplyClearColorValueWithDrawPipelinesEqualityFunc::operator()(
    KeyOfApplyClearColorValueWithDrawPipelines key1,
    KeyOfApplyClearColorValueWithDrawPipelines key2) const {
    if (key1.colorAttachmentCount != key2.colorAttachmentCount) {
        return false;
    }

    if (key1.colorTargetsToApplyClearColorValue != key2.colorTargetsToApplyClearColorValue) {
        return false;
    }

    for (auto i : Range(key1.colorTargetFormats.size())) {
        if (key1.colorTargetFormats[i] != key2.colorTargetFormats[i]) {
            return false;
        }
    }

    return key1.sampleCount == key2.sampleCount &&
           key1.depthStencilFormat == key2.depthStencilFormat;
}

ClearWithDrawHelper::ClearWithDrawHelper() = default;
ClearWithDrawHelper::~ClearWithDrawHelper() = default;

MaybeError ClearWithDrawHelper::Initialize(CommandEncoder* encoder,
                                           const RenderPassDescriptor* renderPassDescriptor) {
    DeviceBase* device = encoder->GetDevice();
    mShouldRun = GetKeyOfApplyClearColorValueWithDrawPipelines(device, renderPassDescriptor, &mKey);
    if (!mShouldRun) {
        return {};
    }

    DAWN_TRY_ASSIGN(mUniformBufferWithClearColorValues,
                    CreateUniformBufferWithClearValues(encoder, renderPassDescriptor, mKey));

    return {};
}

MaybeError ClearWithDrawHelper::Apply(RenderPassEncoder* renderPassEncoder) {
    if (!mShouldRun) {
        return {};
    }

    DeviceBase* device = renderPassEncoder->GetDevice();

    RenderPipelineBase* pipeline = nullptr;
    DAWN_TRY_ASSIGN(pipeline, GetOrCreateApplyClearValueWithDrawPipeline(device, mKey));

    Ref<BindGroupLayoutBase> layout;
    DAWN_TRY_ASSIGN(layout, pipeline->GetBindGroupLayout(0));

    Ref<BindGroupBase> bindGroup;
    DAWN_TRY_ASSIGN(bindGroup,
                    utils::MakeBindGroup(device, layout, {{0, mUniformBufferWithClearColorValues}},
                                         UsageValidationMode::Internal));

    renderPassEncoder->APISetBindGroup(0, bindGroup.Get());
    renderPassEncoder->APISetPipeline(pipeline);
    renderPassEncoder->APIDraw(3);

    return {};
}

}  // namespace dawn::native
