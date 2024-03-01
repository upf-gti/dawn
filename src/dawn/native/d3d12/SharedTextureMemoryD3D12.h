// Copyright 2023 The Dawn & Tint Authors
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

#ifndef SRC_DAWN_NATIVE_D3D12_SHARED_TEXTURE_MEMORY_D3D12_H_
#define SRC_DAWN_NATIVE_D3D12_SHARED_TEXTURE_MEMORY_D3D12_H_

#include "dawn/native/Error.h"
#include "dawn/native/d3d/SharedTextureMemoryD3D.h"
#include "dawn/native/d3d12/d3d12_platform.h"

namespace dawn::native {
namespace d3d {
class KeyedMutex;
}  // namespace d3d

namespace d3d12 {
class Device;

class SharedTextureMemory final : public d3d::SharedTextureMemory {
  public:
    static ResultOrError<Ref<SharedTextureMemory>> Create(
        Device* device,
        const char* label,
        const SharedTextureMemoryDXGISharedHandleDescriptor* descriptor);

    ID3D12Resource* GetD3DResource() const;

    d3d::KeyedMutex* GetKeyedMutex() const;

  private:
    SharedTextureMemory(Device* device,
                        const char* label,
                        SharedTextureMemoryProperties properties,
                        ComPtr<ID3D12Resource> resource,
                        Ref<d3d::KeyedMutex> keyedMutex);

    void DestroyImpl() override;

    ResultOrError<Ref<TextureBase>> CreateTextureImpl(
        const UnpackedPtr<TextureDescriptor>& descriptor) override;

    MaybeError BeginAccessImpl(TextureBase* texture,
                               const UnpackedPtr<BeginAccessDescriptor>& descriptor) override;

    ResultOrError<FenceAndSignalValue> EndAccessImpl(TextureBase* texture,
                                                     UnpackedPtr<EndAccessState>& state) override;

    ComPtr<ID3D12Resource> mResource;
    Ref<d3d::KeyedMutex> mKeyedMutex;
};
}  // namespace d3d12
}  // namespace dawn::native

#endif  // SRC_DAWN_NATIVE_D3D12_SHARED_TEXTURE_MEMORY_D3D12_H_
