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

#include "dawn/native/d3d12/FenceD3D12.h"

#include <utility>

#include "dawn/common/Log.h"
#include "dawn/native/Error.h"
#include "dawn/native/d3d/D3DError.h"
#include "dawn/native/d3d12/DeviceD3D12.h"

namespace dawn::native::d3d12 {

// static
ResultOrError<Ref<Fence>> Fence::CreateFromHandle(ID3D12Device* device,
                                                  HANDLE unownedHandle,
                                                  UINT64 fenceValue) {
    DAWN_ASSERT(unownedHandle != nullptr);
    SystemHandle ownedHandle;
    DAWN_TRY_ASSIGN(ownedHandle, SystemHandle::Duplicate(unownedHandle));

    ComPtr<ID3D12Fence> d3d12Fence;
    DAWN_TRY(CheckHRESULT(device->OpenSharedHandle(ownedHandle.Get(), IID_PPV_ARGS(&d3d12Fence)),
                          "D3D12 fence open handle"));
    return AcquireRef(new Fence(std::move(d3d12Fence), fenceValue, std::move(ownedHandle)));
}

Fence::Fence(ComPtr<ID3D12Fence> d3d12Fence, UINT64 fenceValue, SystemHandle sharedHandle)
    : Base(fenceValue, std::move(sharedHandle)), mD3D12Fence(std::move(d3d12Fence)) {}

Fence::~Fence() = default;

ID3D12Fence* Fence::GetD3D12Fence() const {
    return mD3D12Fence.Get();
}

}  // namespace dawn::native::d3d12
