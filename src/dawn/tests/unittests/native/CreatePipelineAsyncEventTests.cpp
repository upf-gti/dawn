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

#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include <chrono>
#include <memory>
#include <thread>
#include <utility>

#include "dawn/native/DawnNative.h"
#include "dawn/native/Error.h"
#include "dawn/utils/WGPUHelpers.h"
#include "mocks/ComputePipelineMock.h"
#include "mocks/DawnMockTest.h"
#include "mocks/RenderPipelineMock.h"

namespace dawn::native {
namespace {

using ::testing::Test;

static constexpr std::string_view kComputeShader = R"(
        @compute @workgroup_size(1) fn main() {}
    )";

static constexpr std::string_view kVertexShader = R"(
        @vertex fn main() -> @builtin(position) vec4f {
            return vec4f(0.0, 0.0, 0.0, 1.0);
        }
    )";

class CreatePipelineAsyncEventTests : public DawnMockTest {};

// Verify CreateRenderPipelineAsync and the internal CreateRenderPipelineAsyncEvent behavior
// on creating compute pipeline with validation error.
TEST_F(CreatePipelineAsyncEventTests, InitializationValidationErrorInCreateRenderPipelineAsync) {
    wgpu::RenderPipelineDescriptor desc = {};
    desc.vertex.module = utils::CreateShaderModule(device, kVertexShader.data());
    Ref<RenderPipelineMock> renderPipelineMock =
        RenderPipelineMock::Create(mDeviceMock, FromCppAPI(&desc));

    ON_CALL(*renderPipelineMock.Get(), InitializeImpl)
        .WillByDefault(testing::Return(testing::ByMove(
            DAWN_MAKE_ERROR(InternalErrorType::Validation, "Initialization Error"))));
    ON_CALL(*mDeviceMock.get(), CreateUninitializedRenderPipelineImpl)
        .WillByDefault(testing::Return(testing::ByMove(renderPipelineMock)));

    wgpu::CreateRenderPipelineAsyncCallbackInfo callbackInfo = {};
    callbackInfo.mode = wgpu::CallbackMode::AllowProcessEvents;
    callbackInfo.callback =
        [](WGPUCreatePipelineAsyncStatus status, WGPURenderPipeline returnPipeline,
           const char* message, void* userdata) {
            EXPECT_EQ(WGPUCreatePipelineAsyncStatus::WGPUCreatePipelineAsyncStatus_ValidationError,
                      status);
        };
    callbackInfo.userdata = nullptr;

    device.CreateRenderPipelineAsync(&desc, callbackInfo);
    ProcessEvents();

    EXPECT_CALL(*renderPipelineMock.Get(), DestroyImpl).Times(1);
}

// Verify CreateComputePipelineAsync and the internal CreateComputePipelineAsyncEvent behavior
// on creating compute pipeline with internal error.
TEST_F(CreatePipelineAsyncEventTests, InitializationInternalErrorInCreateRenderPipelineAsync) {
    wgpu::RenderPipelineDescriptor desc = {};
    desc.vertex.module = utils::CreateShaderModule(device, kVertexShader.data());
    Ref<RenderPipelineMock> renderPipelineMock =
        RenderPipelineMock::Create(mDeviceMock, FromCppAPI(&desc));

    ON_CALL(*renderPipelineMock.Get(), InitializeImpl)
        .WillByDefault(testing::Return(testing::ByMove(
            DAWN_MAKE_ERROR(dawn::native::InternalErrorType::Internal, "Initialization Error"))));
    ON_CALL(*mDeviceMock.get(), CreateUninitializedRenderPipelineImpl)
        .WillByDefault(testing::Return(testing::ByMove(renderPipelineMock)));

    wgpu::CreateRenderPipelineAsyncCallbackInfo callbackInfo = {};
    callbackInfo.mode = wgpu::CallbackMode::AllowProcessEvents;
    callbackInfo.callback =
        [](WGPUCreatePipelineAsyncStatus status, WGPURenderPipeline returnPipeline,
           const char* message, void* userdata) {
            EXPECT_EQ(WGPUCreatePipelineAsyncStatus::WGPUCreatePipelineAsyncStatus_InternalError,
                      status);
        };
    callbackInfo.userdata = nullptr;

    device.CreateRenderPipelineAsync(&desc, callbackInfo);
    ProcessEvents();

    EXPECT_CALL(*renderPipelineMock.Get(), DestroyImpl).Times(1);
}

// Test that a long async task's execution won't extend to after the device is dropped.
// Device dropping should wait for that task to finish.
TEST_F(CreatePipelineAsyncEventTests, LongAsyncTaskFinishesBeforeDeviceIsDropped) {
    wgpu::RenderPipelineDescriptor desc = {};
    desc.vertex.module = utils::CreateShaderModule(device, kVertexShader.data());
    Ref<RenderPipelineMock> renderPipelineMock =
        RenderPipelineMock::Create(mDeviceMock, FromCppAPI(&desc));

    // Simulate that Initialize() would take a long time to finish.
    ON_CALL(*renderPipelineMock.Get(), InitializeImpl).WillByDefault([]() -> MaybeError {
        std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        return {};
    });
    ON_CALL(*mDeviceMock.get(), CreateUninitializedRenderPipelineImpl)
        .WillByDefault(testing::Return(testing::ByMove(renderPipelineMock)));

    bool done = false;

    wgpu::CreateRenderPipelineAsyncCallbackInfo callbackInfo = {};
    callbackInfo.mode = wgpu::CallbackMode::AllowProcessEvents;
    callbackInfo.callback = [](WGPUCreatePipelineAsyncStatus status,
                               WGPURenderPipeline returnPipeline, const char* message,
                               void* userdata) {
        wgpu::RenderPipeline::Acquire(returnPipeline);

        *static_cast<bool*>(userdata) = true;
    };
    callbackInfo.userdata = &done;

    device.CreateRenderPipelineAsync(&desc, callbackInfo);
    ProcessEvents();
    // Dropping the device should force the async task to finish.
    DropDevice();
    EXPECT_TRUE(done);
}

// Verify CreateComputePipelineAsync and the internal CreateComputePipelineAsyncEvent behavior
// on creating compute pipeline with validation error.
TEST_F(CreatePipelineAsyncEventTests, InitializationValidationErrorInCreateComputePipelineAsync) {
    wgpu::ComputePipelineDescriptor desc = {};
    desc.compute.module = utils::CreateShaderModule(device, kComputeShader.data());
    Ref<ComputePipelineMock> computePipelineMock =
        ComputePipelineMock::Create(mDeviceMock, FromCppAPI(&desc));

    ON_CALL(*computePipelineMock.Get(), InitializeImpl)
        .WillByDefault(testing::Return(testing::ByMove(
            DAWN_MAKE_ERROR(InternalErrorType::Validation, "Initialization Error"))));
    ON_CALL(*mDeviceMock.get(), CreateUninitializedComputePipelineImpl)
        .WillByDefault(testing::Return(testing::ByMove(computePipelineMock)));

    wgpu::CreateComputePipelineAsyncCallbackInfo callbackInfo = {};
    callbackInfo.mode = wgpu::CallbackMode::AllowProcessEvents;
    callbackInfo.callback =
        [](WGPUCreatePipelineAsyncStatus status, WGPUComputePipeline returnPipeline,
           const char* message, void* userdata) {
            EXPECT_EQ(WGPUCreatePipelineAsyncStatus::WGPUCreatePipelineAsyncStatus_ValidationError,
                      status);
        };
    callbackInfo.userdata = nullptr;

    device.CreateComputePipelineAsync(&desc, callbackInfo);
    ProcessEvents();

    EXPECT_CALL(*computePipelineMock.Get(), DestroyImpl).Times(1);
}

// Verify CreateComputePipelineAsync and the internal CreateComputePipelineAsyncEvent behavior
// on creating compute pipeline with internal error.
TEST_F(CreatePipelineAsyncEventTests, InitializationInternalErrorInCreateComputePipelineAsync) {
    wgpu::ComputePipelineDescriptor desc = {};
    desc.compute.module = utils::CreateShaderModule(device, kComputeShader.data());
    Ref<ComputePipelineMock> computePipelineMock =
        ComputePipelineMock::Create(mDeviceMock, FromCppAPI(&desc));

    ON_CALL(*computePipelineMock.Get(), InitializeImpl)
        .WillByDefault(testing::Return(testing::ByMove(
            DAWN_MAKE_ERROR(dawn::native::InternalErrorType::Internal, "Initialization Error"))));
    ON_CALL(*mDeviceMock.get(), CreateUninitializedComputePipelineImpl)
        .WillByDefault(testing::Return(testing::ByMove(computePipelineMock)));

    wgpu::CreateComputePipelineAsyncCallbackInfo callbackInfo = {};
    callbackInfo.mode = wgpu::CallbackMode::AllowProcessEvents;
    callbackInfo.callback =
        [](WGPUCreatePipelineAsyncStatus status, WGPUComputePipeline returnPipeline,
           const char* message, void* userdata) {
            EXPECT_EQ(WGPUCreatePipelineAsyncStatus::WGPUCreatePipelineAsyncStatus_InternalError,
                      status);
        };
    callbackInfo.userdata = nullptr;

    device.CreateComputePipelineAsync(&desc, callbackInfo);
    ProcessEvents();

    EXPECT_CALL(*computePipelineMock.Get(), DestroyImpl).Times(1);
}

}  // anonymous namespace
}  // namespace dawn::native
