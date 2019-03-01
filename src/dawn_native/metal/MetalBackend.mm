// Copyright 2019 The Dawn Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// MetalBackend.cpp: contains the definition of symbols exported by MetalBackend.h so that they
// can be compiled twice: once export (shared library), once not exported (static library)

#include "dawn_native/MetalBackend.h"

#include "dawn_native/Texture.h"
#include "dawn_native/metal/DeviceMTL.h"

namespace dawn_native { namespace metal {

    id<MTLDevice> GetMetalDevice(dawnDevice cDevice) {
        Device* device = reinterpret_cast<Device*>(cDevice);
        return device->GetMTLDevice();
    }

    dawnTexture WrapIOSurface(dawnDevice cDevice,
                              const dawnTextureDescriptor* cDescriptor,
                              IOSurfaceRef ioSurface,
                              uint32_t plane) {
        Device* device = reinterpret_cast<Device*>(cDevice);
        const TextureDescriptor* descriptor =
            reinterpret_cast<const TextureDescriptor*>(cDescriptor);
        TextureBase* texture = device->CreateTextureWrappingIOSurface(descriptor, ioSurface, plane);
        return reinterpret_cast<dawnTexture>(texture);
    }

}}  // namespace dawn_native::metal
