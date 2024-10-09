#version 310 es

uvec3 tint_mod_v3u32(uvec3 lhs, uvec3 rhs) {
  uvec3 v = mix(rhs, uvec3(1u), equal(rhs, uvec3(0u)));
  return (lhs - ((lhs / v) * v));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  uint a = 4u;
  uvec3 b = uvec3(1u, 2u, 3u);
  uvec3 r = tint_mod_v3u32(uvec3(a), b);
}
