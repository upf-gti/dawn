// flags:  --hlsl_shader_model 62
enable f16;
var<private> u = vec3<f16>(1.0h);
fn f() {
    let v : vec3<u32> = vec3<u32>(u);
}