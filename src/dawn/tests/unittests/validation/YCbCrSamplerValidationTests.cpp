// Copyright 2024 The Dawn & Tint Authors
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

#include <vulkan/vulkan.h>

#include "dawn/native/VulkanBackend.h"
#include "dawn/tests/unittests/validation/ValidationTest.h"

namespace dawn {
namespace {

class YCbCrSamplerValidationTest : public ValidationTest {
    void SetUp() override {
        ValidationTest::SetUp();
        DAWN_SKIP_TEST_IF(UsesWire());
    }
};

// Tests that creating a sampler with a valid ycbcr sampler descriptor raises an error
// if the required feature is not enabled.
TEST_F(YCbCrSamplerValidationTest, YCbCrSamplerNotSupportedWithoutFeatureEnabled) {
    wgpu::SamplerDescriptor samplerDesc = {};
    native::vulkan::SamplerYCbCrVulkanDescriptor samplerYCbCrDesc = {};
    samplerDesc.nextInChain = &samplerYCbCrDesc;

    ASSERT_DEVICE_ERROR(device.CreateSampler(&samplerDesc));
}

class YCbCrSamplerWithFeatureValidationTest : public YCbCrSamplerValidationTest {
    WGPUDevice CreateTestDevice(native::Adapter dawnAdapter,
                                wgpu::DeviceDescriptor descriptor) override {
        wgpu::FeatureName requiredFeatures[1] = {wgpu::FeatureName::YCbCrVulkanSamplers};
        descriptor.requiredFeatures = requiredFeatures;
        descriptor.requiredFeatureCount = 1;
        return dawnAdapter.CreateDevice(&descriptor);
    }
};

// Tests that creating a sampler with a valid ycbcr sampler descriptor succeeds if the
// required feature is enabled.
TEST_F(YCbCrSamplerWithFeatureValidationTest, YCbCrSamplerSupportedWhenFeatureEnabled) {
    wgpu::SamplerDescriptor samplerDesc = {};
    native::vulkan::SamplerYCbCrVulkanDescriptor samplerYCbCrDesc = {};
    samplerYCbCrDesc.vulkanYCbCrInfo.sType = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO;
    samplerDesc.nextInChain = &samplerYCbCrDesc;

    device.CreateSampler(&samplerDesc);
}

}  // anonymous namespace
}  // namespace dawn
