// Copyright 2021 The Tint Authors.
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

#include "fuzzers/random_generator.h"
#include "fuzzers/tint_common_fuzzer.h"
#include "fuzzers/tint_init_fuzzer.h"

namespace tint {
namespace fuzzers {

struct Config {
  Config(const uint8_t* data, size_t size) : builder(data, size) {}
  DataBuilder builder;
  transform::Manager manager;
  transform::DataMap inputs;
};

void AddPlatformIndependentPasses(Config* config) {
  GenerateFirstIndexOffsetInputs(&config->builder, &config->inputs);
  GenerateBindingRemapperInputs(&config->builder, &config->inputs);
  GenerateSingleEntryPointInputs(&config->builder, &config->inputs);
  GenerateVertexPullingInputs(&config->builder, &config->inputs);

  config->manager.Add<transform::Robustness>();
  config->manager.Add<transform::FirstIndexOffset>();
  config->manager.Add<transform::BindingRemapper>();
  config->manager.Add<transform::Renamer>();
  config->manager.Add<tint::transform::SingleEntryPoint>();
  config->manager.Add<tint::transform::VertexPulling>();
}

extern "C" int LLVMFuzzerTestOneInput(const uint8_t* data, size_t size) {
  {
    Config config(data, size);
    AddPlatformIndependentPasses(&config);

    fuzzers::CommonFuzzer fuzzer(InputFormat::kWGSL, OutputFormat::kSpv);
    fuzzer.SetTransformManager(&(config.manager), std::move(config.inputs));
    fuzzer.SetDumpInput(GetCliParams().dump_input);

    fuzzer.Run(data, size);
  }

#if TINT_BUILD_HLSL_WRITER
  {
    Config config(data, size);
    AddPlatformIndependentPasses(&config);

    fuzzers::CommonFuzzer fuzzer(InputFormat::kWGSL, OutputFormat::kHLSL);
    fuzzer.SetTransformManager(&config.manager, std::move(config.inputs));
    fuzzer.SetDumpInput(GetCliParams().dump_input);

    fuzzer.Run(data, size);
  }
#endif  // TINT_BUILD_HLSL_WRITER

#if TINT_BUILD_MSL_WRITER
  {
    Config config(data, size);
    AddPlatformIndependentPasses(&config);

    fuzzers::CommonFuzzer fuzzer(InputFormat::kWGSL, OutputFormat::kMSL);
    fuzzer.SetTransformManager(&config.manager, std::move(config.inputs));
    fuzzer.SetDumpInput(GetCliParams().dump_input);

    fuzzer.Run(data, size);
  }
#endif  // TINT_BUILD_MSL_WRITER
#if TINT_BUILD_SPV_WRITER
  {
    Config config(data, size);
    AddPlatformIndependentPasses(&config);

    fuzzers::CommonFuzzer fuzzer(InputFormat::kWGSL, OutputFormat::kSpv);
    fuzzer.SetTransformManager(&config.manager, std::move(config.inputs));
    fuzzer.SetDumpInput(GetCliParams().dump_input);

    fuzzer.Run(data, size);
  }
#endif  // TINT_BUILD_SPV_WRITER

  return 0;
}

}  // namespace fuzzers
}  // namespace tint
