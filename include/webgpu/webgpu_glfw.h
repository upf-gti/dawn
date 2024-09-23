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

#ifndef INCLUDE_WEBGPU_WEBGPU_GLFW_H_
#define INCLUDE_WEBGPU_WEBGPU_GLFW_H_

#include <memory>

#include "webgpu/webgpu_cpp.h"

#if defined(WGPU_GLFW_SHARED_LIBRARY)
#if defined(_WIN32)
#if defined(WGPU_GLFW_IMPLEMENTATION)
#define WGPU_GLFW_EXPORT __declspec(dllexport)
#else
#define WGPU_GLFW_EXPORT __declspec(dllimport)
#endif
#else  // defined(_WIN32)
#if defined(WGPU_GLFW_IMPLEMENTATION)
#define WGPU_GLFW_EXPORT __attribute__((visibility("default")))
#else
#define WGPU_GLFW_EXPORT
#endif
#endif  // defined(_WIN32)
#else   // defined(WGPU_GLFW_SHARED_LIBRARY)
#define WGPU_GLFW_EXPORT
#endif  // defined(WGPU_GLFW_SHARED_LIBRARY)

struct GLFWwindow;

namespace wgpu::glfw {

// Does the necessary setup on the GLFWwindow to allow creating a wgpu::Surface with it and
// calls `instance.CreateSurface` with the correct descriptor for this window.
// Returns a null wgpu::Surface on failure.
WGPU_GLFW_EXPORT wgpu::Surface CreateSurfaceForWindow(const wgpu::Instance& instance,
                                                      GLFWwindow* window);

// Use for testing only. Does everything that CreateSurfaceForWindow does except the call to
// CreateSurface. Useful to be able to modify the descriptor for testing, or when trying to
// avoid using the global proc table.
WGPU_GLFW_EXPORT std::unique_ptr<wgpu::ChainedStruct, void (*)(wgpu::ChainedStruct*)>
SetupWindowAndGetSurfaceDescriptor(GLFWwindow* window);

}  // namespace wgpu::glfw

#endif  // INCLUDE_WEBGPU_WEBGPU_GLFW_H_
