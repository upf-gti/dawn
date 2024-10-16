#version 310 es


struct S {
  vec3 v;
  uint tint_pad;
};

layout(binding = 0, std140)
uniform tint_symbol_1_1_ubo {
  S tint_symbol;
} v_1;
void f() {
  vec3 v = v_1.tint_symbol.v;
  float x = v_1.tint_symbol.v.x;
  float y = v_1.tint_symbol.v.y;
  float z = v_1.tint_symbol.v.z;
  vec2 xx = v_1.tint_symbol.v.xx;
  vec2 xy = v_1.tint_symbol.v.xy;
  vec2 xz = v_1.tint_symbol.v.xz;
  vec2 yx = v_1.tint_symbol.v.yx;
  vec2 yy = v_1.tint_symbol.v.yy;
  vec2 yz = v_1.tint_symbol.v.yz;
  vec2 zx = v_1.tint_symbol.v.zx;
  vec2 zy = v_1.tint_symbol.v.zy;
  vec2 zz = v_1.tint_symbol.v.zz;
  vec3 xxx = v_1.tint_symbol.v.xxx;
  vec3 xxy = v_1.tint_symbol.v.xxy;
  vec3 xxz = v_1.tint_symbol.v.xxz;
  vec3 xyx = v_1.tint_symbol.v.xyx;
  vec3 xyy = v_1.tint_symbol.v.xyy;
  vec3 xyz = v_1.tint_symbol.v.xyz;
  vec3 xzx = v_1.tint_symbol.v.xzx;
  vec3 xzy = v_1.tint_symbol.v.xzy;
  vec3 xzz = v_1.tint_symbol.v.xzz;
  vec3 yxx = v_1.tint_symbol.v.yxx;
  vec3 yxy = v_1.tint_symbol.v.yxy;
  vec3 yxz = v_1.tint_symbol.v.yxz;
  vec3 yyx = v_1.tint_symbol.v.yyx;
  vec3 yyy = v_1.tint_symbol.v.yyy;
  vec3 yyz = v_1.tint_symbol.v.yyz;
  vec3 yzx = v_1.tint_symbol.v.yzx;
  vec3 yzy = v_1.tint_symbol.v.yzy;
  vec3 yzz = v_1.tint_symbol.v.yzz;
  vec3 zxx = v_1.tint_symbol.v.zxx;
  vec3 zxy = v_1.tint_symbol.v.zxy;
  vec3 zxz = v_1.tint_symbol.v.zxz;
  vec3 zyx = v_1.tint_symbol.v.zyx;
  vec3 zyy = v_1.tint_symbol.v.zyy;
  vec3 zyz = v_1.tint_symbol.v.zyz;
  vec3 zzx = v_1.tint_symbol.v.zzx;
  vec3 zzy = v_1.tint_symbol.v.zzy;
  vec3 zzz = v_1.tint_symbol.v.zzz;
  vec4 xxxx = v_1.tint_symbol.v.xxxx;
  vec4 xxxy = v_1.tint_symbol.v.xxxy;
  vec4 xxxz = v_1.tint_symbol.v.xxxz;
  vec4 xxyx = v_1.tint_symbol.v.xxyx;
  vec4 xxyy = v_1.tint_symbol.v.xxyy;
  vec4 xxyz = v_1.tint_symbol.v.xxyz;
  vec4 xxzx = v_1.tint_symbol.v.xxzx;
  vec4 xxzy = v_1.tint_symbol.v.xxzy;
  vec4 xxzz = v_1.tint_symbol.v.xxzz;
  vec4 xyxx = v_1.tint_symbol.v.xyxx;
  vec4 xyxy = v_1.tint_symbol.v.xyxy;
  vec4 xyxz = v_1.tint_symbol.v.xyxz;
  vec4 xyyx = v_1.tint_symbol.v.xyyx;
  vec4 xyyy = v_1.tint_symbol.v.xyyy;
  vec4 xyyz = v_1.tint_symbol.v.xyyz;
  vec4 xyzx = v_1.tint_symbol.v.xyzx;
  vec4 xyzy = v_1.tint_symbol.v.xyzy;
  vec4 xyzz = v_1.tint_symbol.v.xyzz;
  vec4 xzxx = v_1.tint_symbol.v.xzxx;
  vec4 xzxy = v_1.tint_symbol.v.xzxy;
  vec4 xzxz = v_1.tint_symbol.v.xzxz;
  vec4 xzyx = v_1.tint_symbol.v.xzyx;
  vec4 xzyy = v_1.tint_symbol.v.xzyy;
  vec4 xzyz = v_1.tint_symbol.v.xzyz;
  vec4 xzzx = v_1.tint_symbol.v.xzzx;
  vec4 xzzy = v_1.tint_symbol.v.xzzy;
  vec4 xzzz = v_1.tint_symbol.v.xzzz;
  vec4 yxxx = v_1.tint_symbol.v.yxxx;
  vec4 yxxy = v_1.tint_symbol.v.yxxy;
  vec4 yxxz = v_1.tint_symbol.v.yxxz;
  vec4 yxyx = v_1.tint_symbol.v.yxyx;
  vec4 yxyy = v_1.tint_symbol.v.yxyy;
  vec4 yxyz = v_1.tint_symbol.v.yxyz;
  vec4 yxzx = v_1.tint_symbol.v.yxzx;
  vec4 yxzy = v_1.tint_symbol.v.yxzy;
  vec4 yxzz = v_1.tint_symbol.v.yxzz;
  vec4 yyxx = v_1.tint_symbol.v.yyxx;
  vec4 yyxy = v_1.tint_symbol.v.yyxy;
  vec4 yyxz = v_1.tint_symbol.v.yyxz;
  vec4 yyyx = v_1.tint_symbol.v.yyyx;
  vec4 yyyy = v_1.tint_symbol.v.yyyy;
  vec4 yyyz = v_1.tint_symbol.v.yyyz;
  vec4 yyzx = v_1.tint_symbol.v.yyzx;
  vec4 yyzy = v_1.tint_symbol.v.yyzy;
  vec4 yyzz = v_1.tint_symbol.v.yyzz;
  vec4 yzxx = v_1.tint_symbol.v.yzxx;
  vec4 yzxy = v_1.tint_symbol.v.yzxy;
  vec4 yzxz = v_1.tint_symbol.v.yzxz;
  vec4 yzyx = v_1.tint_symbol.v.yzyx;
  vec4 yzyy = v_1.tint_symbol.v.yzyy;
  vec4 yzyz = v_1.tint_symbol.v.yzyz;
  vec4 yzzx = v_1.tint_symbol.v.yzzx;
  vec4 yzzy = v_1.tint_symbol.v.yzzy;
  vec4 yzzz = v_1.tint_symbol.v.yzzz;
  vec4 zxxx = v_1.tint_symbol.v.zxxx;
  vec4 zxxy = v_1.tint_symbol.v.zxxy;
  vec4 zxxz = v_1.tint_symbol.v.zxxz;
  vec4 zxyx = v_1.tint_symbol.v.zxyx;
  vec4 zxyy = v_1.tint_symbol.v.zxyy;
  vec4 zxyz = v_1.tint_symbol.v.zxyz;
  vec4 zxzx = v_1.tint_symbol.v.zxzx;
  vec4 zxzy = v_1.tint_symbol.v.zxzy;
  vec4 zxzz = v_1.tint_symbol.v.zxzz;
  vec4 zyxx = v_1.tint_symbol.v.zyxx;
  vec4 zyxy = v_1.tint_symbol.v.zyxy;
  vec4 zyxz = v_1.tint_symbol.v.zyxz;
  vec4 zyyx = v_1.tint_symbol.v.zyyx;
  vec4 zyyy = v_1.tint_symbol.v.zyyy;
  vec4 zyyz = v_1.tint_symbol.v.zyyz;
  vec4 zyzx = v_1.tint_symbol.v.zyzx;
  vec4 zyzy = v_1.tint_symbol.v.zyzy;
  vec4 zyzz = v_1.tint_symbol.v.zyzz;
  vec4 zzxx = v_1.tint_symbol.v.zzxx;
  vec4 zzxy = v_1.tint_symbol.v.zzxy;
  vec4 zzxz = v_1.tint_symbol.v.zzxz;
  vec4 zzyx = v_1.tint_symbol.v.zzyx;
  vec4 zzyy = v_1.tint_symbol.v.zzyy;
  vec4 zzyz = v_1.tint_symbol.v.zzyz;
  vec4 zzzx = v_1.tint_symbol.v.zzzx;
  vec4 zzzy = v_1.tint_symbol.v.zzzy;
  vec4 zzzz = v_1.tint_symbol.v.zzzz;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
