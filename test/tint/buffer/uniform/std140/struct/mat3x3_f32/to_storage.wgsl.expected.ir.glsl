#version 310 es


struct S_std140 {
  int before;
  uint tint_pad;
  uint tint_pad_1;
  uint tint_pad_2;
  vec3 m_col0;
  uint tint_pad_3;
  vec3 m_col1;
  uint tint_pad_4;
  vec3 m_col2;
  uint tint_pad_5;
  int after;
  uint tint_pad_6;
  uint tint_pad_7;
  uint tint_pad_8;
  uint tint_pad_9;
  uint tint_pad_10;
  uint tint_pad_11;
  uint tint_pad_12;
  uint tint_pad_13;
  uint tint_pad_14;
  uint tint_pad_15;
  uint tint_pad_16;
  uint tint_pad_17;
  uint tint_pad_18;
  uint tint_pad_19;
  uint tint_pad_20;
};

struct S {
  int before;
  uint tint_pad_21;
  uint tint_pad_22;
  uint tint_pad_23;
  mat3 m;
  int after;
  uint tint_pad_24;
  uint tint_pad_25;
  uint tint_pad_26;
  uint tint_pad_27;
  uint tint_pad_28;
  uint tint_pad_29;
  uint tint_pad_30;
  uint tint_pad_31;
  uint tint_pad_32;
  uint tint_pad_33;
  uint tint_pad_34;
  uint tint_pad_35;
  uint tint_pad_36;
  uint tint_pad_37;
  uint tint_pad_38;
};

layout(binding = 0, std140)
uniform tint_symbol_1_std140_1_ubo {
  S_std140 tint_symbol[4];
} v;
layout(binding = 1, std430)
buffer tint_symbol_3_1_ssbo {
  S tint_symbol_2[4];
} v_1;
S tint_convert_S(S_std140 tint_input) {
  return S(tint_input.before, 0u, 0u, 0u, mat3(tint_input.m_col0, tint_input.m_col1, tint_input.m_col2), tint_input.after, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u);
}
void tint_store_and_preserve_padding_2(inout mat3 target, mat3 value_param) {
  target[0u] = value_param[0u];
  target[1u] = value_param[1u];
  target[2u] = value_param[2u];
}
void tint_store_and_preserve_padding_1(inout S target, S value_param) {
  target.before = value_param.before;
  tint_store_and_preserve_padding_2(target.m, value_param.m);
  target.after = value_param.after;
}
void tint_store_and_preserve_padding(inout S target[4], S value_param[4]) {
  {
    uint v_2 = 0u;
    v_2 = 0u;
    while(true) {
      uint v_3 = v_2;
      if ((v_3 >= 4u)) {
        break;
      }
      tint_store_and_preserve_padding_1(target[v_3], value_param[v_3]);
      {
        v_2 = (v_3 + 1u);
      }
      continue;
    }
  }
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  S_std140 v_4[4] = v.tint_symbol;
  S v_5[4] = S[4](S(0, 0u, 0u, 0u, mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f)), 0, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u), S(0, 0u, 0u, 0u, mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f)), 0, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u), S(0, 0u, 0u, 0u, mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f)), 0, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u), S(0, 0u, 0u, 0u, mat3(vec3(0.0f), vec3(0.0f), vec3(0.0f)), 0, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u));
  {
    uint v_6 = 0u;
    v_6 = 0u;
    while(true) {
      uint v_7 = v_6;
      if ((v_7 >= 4u)) {
        break;
      }
      v_5[v_7] = tint_convert_S(v_4[v_7]);
      {
        v_6 = (v_7 + 1u);
      }
      continue;
    }
  }
  tint_store_and_preserve_padding(v_1.tint_symbol_2, v_5);
  tint_store_and_preserve_padding_1(v_1.tint_symbol_2[1], tint_convert_S(v.tint_symbol[2]));
  tint_store_and_preserve_padding_2(v_1.tint_symbol_2[3].m, mat3(v.tint_symbol[2].m_col0, v.tint_symbol[2].m_col1, v.tint_symbol[2].m_col2));
  v_1.tint_symbol_2[1].m[0] = v.tint_symbol[0].m_col1.zxy;
}
