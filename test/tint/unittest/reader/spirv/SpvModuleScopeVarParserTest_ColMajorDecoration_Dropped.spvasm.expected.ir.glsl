SKIP: FAILED

#version 310 es

struct S {
  mat3x2 field0;
};

S myvar = S(mat3x2(vec2(0.0f), vec2(0.0f), vec2(0.0f)));
void main_1() {
}
void main() {
  main_1();
}
error: Error parsing GLSL shader:
ERROR: 0:4: 'float' : type requires declaration of default precision qualifier 
ERROR: 0:4: '' : compilation terminated 
ERROR: 2 compilation errors.  No code generated.




tint executable returned error: exit status 1
