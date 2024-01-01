// Copyright 2019 The Dawn & Tint Authors
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
#ifndef SRC_DAWN_NATIVE_VULKAN_COMMANDRECORDINGCONTEXT_H_
#define SRC_DAWN_NATIVE_VULKAN_COMMANDRECORDINGCONTEXT_H_

#include <set>
#include <vector>

#include "dawn/common/vulkan_platform.h"
#include "dawn/native/vulkan/BufferVk.h"
#include "dawn/native/vulkan/VulkanFunctions.h"

namespace dawn::native::vulkan {

class Texture;

// Wrapping class that currently associates a command buffer to it's corresponding pool.
// TODO(dawn:1601) Revisit this structure since it is where the 1:1 mapping is implied.
//                 Also consider reusing this in CommandRecordingContext below instead of
//                 flattening the pool and command buffer again.
struct CommandPoolAndBuffer {
    VkCommandPool pool = VK_NULL_HANDLE;
    VkCommandBuffer commandBuffer = VK_NULL_HANDLE;
};

// Used to track operations that are handled after recording.
// Currently only tracks semaphores, but may be used to do barrier coalescing in the future.
struct CommandRecordingContext {
    VkCommandBuffer commandBuffer = VK_NULL_HANDLE;
    std::vector<VkSemaphore> waitSemaphores = {};
    std::vector<VkSemaphore> signalSemaphores = {};

    // The internal buffers used in the workaround of texture-to-texture copies with compressed
    // formats.
    std::vector<Ref<Buffer>> tempBuffers;

    // External textures that will be eagerly transitioned just before VkSubmit. The textures are
    // kept alive by the CommandBuffer so they don't need to be Ref-ed.
    std::set<Texture*> externalTexturesForEagerTransition;

    // Mappable buffers which will be eagerly transitioned to usage MapRead or MapWrite after
    // VkSubmit.
    std::set<Ref<Buffer>> mappableBuffersForEagerTransition;

    // For Device state tracking only.
    VkCommandPool commandPool = VK_NULL_HANDLE;
    bool needsSubmit = false;
    bool used = false;

    // In some cases command buffer will need to be split to accomodate driver bug workarounds.
    // See the VulkanSplitCommandBufferOnDepthStencilComputeSampleAfterRenderPass toggle as an
    // example. This tracks the list of all command buffers used for this recording context,
    // with commandBuffer always being the last element.
    std::vector<VkCommandBuffer> commandBufferList;
    std::vector<VkCommandPool> commandPoolList;

    // Need to track if a render pass has already been recorded for the
    // VulkanSplitCommandBufferOnComputePassAfterRenderPass workaround.
    bool hasRecordedRenderPass = false;
};

}  // namespace dawn::native::vulkan

#endif  // SRC_DAWN_NATIVE_VULKAN_COMMANDRECORDINGCONTEXT_H_
