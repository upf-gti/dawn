//* Copyright 2024 The Dawn & Tint Authors
//*
//* Redistribution and use in source and binary forms, with or without
//* modification, are permitted provided that the following conditions are met:
//*
//* 1. Redistributions of source code must retain the above copyright notice, this
//*    list of conditions and the following disclaimer.
//*
//* 2. Redistributions in binary form must reproduce the above copyright notice,
//*    this list of conditions and the following disclaimer in the documentation
//*    and/or other materials provided with the distribution.
//*
//* 3. Neither the name of the copyright holder nor the names of its
//*    contributors may be used to endorse or promote products derived from
//*    this software without specific prior written permission.
//*
//* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

{% macro arg_to_jni_type(arg) %}
    {% if arg.length == 'strlen' %}
        jstring
    {% elif arg.length and arg.length != 'constant' %}
        {% if arg.type.category in ['bitmask', 'enum', 'function pointer', 'object', 'structure'] %}
            jobjectArray
        {% elif arg.type.name.get() == 'void' %}
            jobject
        {% elif arg.type.name.get() == 'uint32_t' %}
            jintArray
        {% else %}
            {{ unreachable_code() }}
        {% endif %}
    {% else %}
        {{ to_jni_type(arg.type) }}
    {% endif %}
{% endmacro %}

{% macro to_jni_type(type) %}
    {% if type.category in ['function pointer', 'object', 'structure'] %}
        jobject
    {% elif type.category in ['bitmask', 'enum'] %}
        jint
    {% else %}
        {{ jni_primitives[type.name.get()] }}
    {% endif %}
{% endmacro %}

{% macro jni_signature(member) %}
    {%- if member.length == 'strlen' -%}
        Ljava/lang/String;
    {%- elif member.length and member.length != 'constant' -%}
        {%- if member.type.category in ['bitmask', 'enum', 'function pointer', 'object', 'structure'] -%}
            //*  JvmInline does not inline bitmask/enums in arrays.
            [L{{ jni_name(member.type) }};
        {%- elif member.type.name.get() == 'uint32_t' -%}
            [I
        {%- else -%}
            {{ unreachable_code() }}
        {%- endif -%}
    {%- elif member.type.category in ['function pointer', 'object', 'structure'] -%}
        L{{ jni_name(member.type) }};
    {%- elif member.type.name.get() in ['int64_t', 'uint64_t', 'size_t', 'void *'] -%}
        J
    {%- elif member.type.name.get() in ['int32_t', 'uint32_t'] or member.type.category in ['bitmask', 'enum'] -%}
        //*  JvmInline makes lone bitmask/enums appear as integer to JNI.
        I
    {%- elif member.type.name.get() in ['int16_t', 'uint16_t'] -%}
        S
    {%- elif member.type.name.get() == 'double' -%}
        D
    {%- elif member.type.name.get() == 'float' -%}
        F
    {%- elif member.type.name.get() == 'bool' -%}
        Z
    {%- else -%}
        {{ unreachable_code('Unsupported type: ' + member.type.name.get()) }}
    {%- endif -%}
{% endmacro %}

{% macro convert_array_element_to_kotlin(input, output, size, member) %}
    {% if member.type.category in ['bitmask', 'enum'] %}
        //* Kotlin value classes do not get inlined in arrays, so the creation method is different.
        jobject {{ output }};
        {
            jclass clz = env->FindClass("{{ jni_name(member.type) }}");
            {{ output }} = env->NewObject(clz, env->GetMethodID(clz, "<init>", "(I)V"),
                    static_cast<jint>({{ input }}));
        }
    {% else %}
        {{ convert_to_kotlin(input, output, size, member) }}
    {% endif %}
{% endmacro %}

{% macro convert_to_kotlin(input, output, size, member) %}
    {% if size is string %}
        {% if member.type.name.get() in ['void const *', 'void *'] %}
            jobject {{ output }} = toByteBuffer(env, {{ input }}, {{ size }});
        {% elif member.type.category in ['bitmask', 'enum', 'object', 'structure'] %}
            //* Native container converted to a Kotlin container.
            jobjectArray {{ output }} = env->NewObjectArray({{ size }},
                    env->FindClass("{{ jni_name(member.type) }}"), 0);
            for (int idx = 0; idx != {{ size }}; idx++) {
                {{ convert_array_element_to_kotlin(input + '[idx]', 'element', None, {'type': member.type}) }}
                env->SetObjectArrayElement({{ output }}, idx, element);
            }
        {% elif member.type.name.get() in ['int', 'int32_t', 'uint32_t'] %}
            jintArray {{ output }} = env->NewIntArray({{ size }});
            env->SetIntArrayRegion({{ output }}, 0, {{ size }},
                    reinterpret_cast<const jint *>({{ input }}));
        {% else %}
            {{ unreachable_code() }}
        {% endif %}
    {% elif member.type.category == 'object' %}
        jobject {{ output }};
        {
            jclass clz = env->FindClass("{{ jni_name(member.type) }}");
            {{ output }} = env->NewObject(clz, env->GetMethodID(clz, "<init>", "(J)V"),
                    reinterpret_cast<jlong>({{ input }}));
        }
    {% elif member.type.category == 'structure' %}
        jobject {{ output }} =
                ToKotlin(env, {{ '&' if member.annotation not in ['*', 'const*'] }}{{ input }});
    {% elif member.type.name.get() == 'void *' %}
        jlong {{ output }} = reinterpret_cast<jlong>({{ input }});
    {% elif member.type.name.get() == 'char' %}
        jstring {{ output }} = {{ input }} ? env->NewStringUTF({{ input }}) : nullptr;
    {% elif member.type.category in ['bitmask', 'enum', 'native'] %}
        //* We use Kotlin value classes for bitmask and enum, and they get inlined as lone values.
        {{ to_jni_type(member.type) }} {{ output }} =
                static_cast<{{ to_jni_type(member.type) }}>({{ input }});
    {% else %}
        {{ unreachable_code() }}
    {% endif %}
{% endmacro %}
