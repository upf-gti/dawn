mkdir build_windows
cd build_windows
cmake .. -DCMAKE_INSTALL_PREFIX:PATH=static_build^
         -DCMAKE_BUILD_TYPE=Release^
         -DDAWN_FORCE_SYSTEM_COMPONENT_LOAD=ON^
         -DDAWN_FETCH_DEPENDENCIES=ON^
         -DDAWN_BUILD_MONOLITHIC_LIBRARY=STATIC^
         -DBUILD_SHARED_LIBS=OFF^
         -DDAWN_ENABLE_VULKAN=ON^
         -DDAWN_ENABLE_D3D12=ON^
         -DDAWN_ENABLE_D3D11=OFF^
         -DDAWN_ENABLE_NULL=OFF^
         -DDAWN_BUILD_SAMPLES=OFF^
         -DDAWN_BUILD_TESTS=OFF^
         -DDAWN_ENABLE_SPIRV_VALIDATION=OFF^
         -DDAWN_USE_GLFW=OFF^
         -DDAWN_ENABLE_INSTALL=ON^
         -DTINT_BUILD_SAMPLES=OFF^
         -DTINT_BUILD_DOCS=OFF^
         -DTINT_BUILD_FUZZERS=OFF^
         -DTINT_BUILD_SPIRV_TOOLS_FUZZER=OFF^
         -DTINT_BUILD_SPV_WRITER=OFF^
         -DTINT_BUILD_AST_FUZZER=OFF^
         -DTINT_BUILD_REGEX_FUZZER=OFF^
         -DTINT_BUILD_BENCHMARKS=OFF^
         -DTINT_BUILD_GLSL_VALIDATOR=OFF^
         -DTINT_BUILD_TESTS=OFF^
         -DTINT_BUILD_CMD_TOOLS=OFF^
         -DTINT_ENABLE_IR_VALIDATION=OFF^
         -DTINT_BUILD_IR_BINARY=ON^
         -DTINT_ENABLE_INSTALL=ON

devenv Dawn.slnx /Build Release
devenv Dawn.slnx /Build Debug

cmake --install . --config Release

ren static_build\lib\webgpu_dawn.lib webgpu_dawn_release.lib

cmake --install . --config Debug

ren static_build\lib\webgpu_dawn.lib webgpu_dawn_debug.lib

del static_build\lib\tint* /s
rmdir static_build\lib\cmake /s

robocopy /s static_build\include\src\tint\src static_build\include\src /MOVE

xcopy ..\src\utils\compiler.h static_build\include\src\utils\compiler.h*