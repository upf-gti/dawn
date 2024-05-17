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

#include "src/tint/cmd/fuzz/wgsl/fuzz.h"

#include <iostream>
#include <thread>

#include "src/tint/lang/wgsl/common/allowed_features.h"
#include "src/tint/lang/wgsl/reader/options.h"
#include "src/tint/lang/wgsl/reader/reader.h"
#include "src/tint/utils/containers/vector.h"
#include "src/tint/utils/macros/defer.h"
#include "src/tint/utils/macros/static_init.h"

#if TINT_BUILD_WGSL_WRITER
#include "src/tint/lang/wgsl/program/program.h"
#include "src/tint/lang/wgsl/writer/writer.h"
#endif

namespace tint::fuzz::wgsl {
namespace {

/// @returns a reference to the static list of registered ProgramFuzzers.
/// @note this is not a global, as the static initializers that register fuzzers may be called
/// before this vector is constructed.
Vector<ProgramFuzzer, 32>& Fuzzers() {
    static Vector<ProgramFuzzer, 32> fuzzers;
    return fuzzers;
}

thread_local std::string_view currently_running;

[[noreturn]] void TintInternalCompilerErrorReporter(const tint::InternalCompilerError& err) {
    std::cerr << "ICE while running fuzzer: '" << currently_running << "'" << std::endl;
    std::cerr << err.Error() << std::endl;
    __builtin_trap();
}

}  // namespace

void Register(const ProgramFuzzer& fuzzer) {
    Fuzzers().Push(fuzzer);
}

void Run(std::string_view wgsl, const Options& options, Slice<const std::byte> data) {
    tint::SetInternalCompilerErrorReporter(&TintInternalCompilerErrorReporter);

#if TINT_BUILD_WGSL_WRITER
    // Register the Program printer. This is used for debugging purposes.
    tint::Program::printer = [](const tint::Program& program) {
        auto result = tint::wgsl::writer::Generate(program, {});
        if (result != Success) {
            return result.Failure().reason.Str();
        }
        return result->wgsl;
    };
#endif

    // Ensure that fuzzers are sorted. Without this, the fuzzers may be registered in any order,
    // leading to non-determinism, which we must avoid.
    TINT_STATIC_INIT(Fuzzers().Sort([](auto& a, auto& b) { return a.name < b.name; }));

    // Create a Source::File to hand to the parser.
    tint::Source::File file("test.wgsl", wgsl);

    // Parse the WGSL program.
    tint::wgsl::reader::Options parse_options;
    parse_options.allowed_features = tint::wgsl::AllowedFeatures::Everything();
    auto program = tint::wgsl::reader::Parse(&file, parse_options);
    if (!program.IsValid()) {
        if (options.verbose) {
            std::cerr << "invalid WGSL program: " << std::endl
                      << program.Diagnostics() << std::endl;
        }
        return;
    }

    // Run each of the program fuzzer functions
    if (options.run_concurrently) {
        size_t n = Fuzzers().Length();
        tint::Vector<std::thread, 32> threads;
        threads.Reserve(n);
        for (size_t i = 0; i < n; i++) {
            if (!options.filter.empty() &&
                Fuzzers()[i].name.find(options.filter) == std::string::npos) {
                continue;
            }
            threads.Push(std::thread([i, &program, &data, &options] {
                auto& fuzzer = Fuzzers()[i];
                currently_running = fuzzer.name;
                if (options.verbose) {
                    std::cout << " • [" << i << "] Running: " << currently_running << std::endl;
                }
                fuzzer.fn(program, options, data);
            }));
        }
        for (auto& thread : threads) {
            thread.join();
        }
    } else {
        TINT_DEFER(currently_running = "");
        for (auto& fuzzer : Fuzzers()) {
            if (!options.filter.empty() && fuzzer.name.find(options.filter) == std::string::npos) {
                continue;
            }

            currently_running = fuzzer.name;
            if (options.verbose) {
                std::cout << " • Running: " << currently_running << std::endl;
            }
            fuzzer.fn(program, options, data);
        }
    }
}

}  // namespace tint::fuzz::wgsl
