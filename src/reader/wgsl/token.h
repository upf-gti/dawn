// Copyright 2020 The Tint Authors.
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

#ifndef SRC_READER_WGSL_TOKEN_H_
#define SRC_READER_WGSL_TOKEN_H_

#include <string>

#include "src/source.h"

namespace tint {
namespace reader {
namespace wgsl {

/// Stores tokens generated by the Lexer
class Token {
 public:
  /// The type of the parsed token
  enum class Type {
    /// Error result
    kError = -2,
    /// Reserved keyword
    kReservedKeyword = -1,
    /// Uninitialized token
    kUninitialized = 0,
    /// End of input string reached
    kEOF,

    /// An identifier
    kIdentifier,
    /// A float value
    kFloatLiteral,
    /// An signed int value
    kSintLiteral,
    /// A unsigned int value
    kUintLiteral,

    /// A '&'
    kAnd,
    /// A '&&'
    kAndAnd,
    /// A '->'
    kArrow,
    /// A '[['
    kAttrLeft,
    /// A ']]'
    kAttrRight,
    /// A '/'
    kForwardSlash,
    /// A '!'
    kBang,
    /// A '['
    kBracketLeft,
    /// A ']'
    kBracketRight,
    /// A '{'
    kBraceLeft,
    /// A '}'
    kBraceRight,
    /// A ':'
    kColon,
    /// A ','
    kComma,
    /// A '='
    kEqual,
    /// A '=='
    kEqualEqual,
    /// A '>'
    kGreaterThan,
    /// A '>='
    kGreaterThanEqual,
    /// A '>>'
    kShiftRight,
    /// A '<'
    kLessThan,
    /// A '<='
    kLessThanEqual,
    /// A '<<'
    kShiftLeft,
    /// A '%'
    kMod,
    /// A '-'
    kMinus,
    /// A '!='
    kNotEqual,
    /// A '.'
    kPeriod,
    /// A '+'
    kPlus,
    /// A '|'
    kOr,
    /// A '||'
    kOrOr,
    /// A '('
    kParenLeft,
    /// A ')'
    kParenRight,
    /// A ';'
    kSemicolon,
    /// A '*'
    kStar,
    /// A '^'
    kXor,

    /// A 'array'
    kArray,
    /// A 'bitcast'
    kBitcast,
    /// A 'bool'
    kBool,
    /// A 'break'
    kBreak,
    /// A 'case'
    kCase,
    /// A 'continue'
    kContinue,
    /// A 'continuing'
    kContinuing,
    /// A 'discard'
    kDiscard,
    /// A 'default'
    kDefault,
    /// A 'else'
    kElse,
    /// A 'elseif'
    kElseIf,
    /// A 'f32'
    kF32,
    /// A 'fallthrough'
    kFallthrough,
    /// A 'false'
    kFalse,
    /// A 'fn'
    kFn,
    // A 'for'
    kFor,
    // A 'Bgra8Unorm' format
    kFormatBgra8Unorm,
    // A 'Bgra8UnormSrgb' format
    kFormatBgra8UnormSrgb,
    // A 'R16Float' format
    kFormatR16Float,
    // A 'R16Sint' format
    kFormatR16Sint,
    // A 'R16Uint' format
    kFormatR16Uint,
    // A 'R32Float' format
    kFormatR32Float,
    // A 'R32Sint' format
    kFormatR32Sint,
    // A 'R32Uint' format
    kFormatR32Uint,
    // A 'R8Sint' format
    kFormatR8Sint,
    // A 'R8Snorm' format
    kFormatR8Snorm,
    // A 'R8Uint' format
    kFormatR8Uint,
    // A 'R8Unorm' format
    kFormatR8Unorm,
    // A 'Rg11B10Float' format
    kFormatRg11B10Float,
    // A 'Rg16Float' format
    kFormatRg16Float,
    // A 'Rg16Sint' format
    kFormatRg16Sint,
    // A 'Rg16Uint' format
    kFormatRg16Uint,
    // A 'Rg32Float' format
    kFormatRg32Float,
    // A 'Rg32Sint' format
    kFormatRg32Sint,
    // A 'Rg32Uint' format
    kFormatRg32Uint,
    // A 'Rg8Sint' format
    kFormatRg8Sint,
    // A 'Rg8Snorm' format
    kFormatRg8Snorm,
    // A 'Rg8Uint' format
    kFormatRg8Uint,
    // A 'Rg8Unorm' format
    kFormatRg8Unorm,
    // A 'Rgb10A2Unorm' format
    kFormatRgb10A2Unorm,
    // A 'Rgba16Float' format
    kFormatRgba16Float,
    // A 'Rgba16Sint' format
    kFormatRgba16Sint,
    // A 'Rgba16Uint' format
    kFormatRgba16Uint,
    // A 'Rgba32Float' format
    kFormatRgba32Float,
    // A 'Rgba32Sint' format
    kFormatRgba32Sint,
    // A 'Rgba32Uint' format
    kFormatRgba32Uint,
    // A 'Rgba8Sint' format
    kFormatRgba8Sint,
    // A 'Rgba8Snorm' format
    kFormatRgba8Snorm,
    // A 'Rgba8Uint' format
    kFormatRgba8Uint,
    // A 'Rgba8Unorm' format
    kFormatRgba8Unorm,
    // A 'Rgba8UnormSrgb' format
    kFormatRgba8UnormSrgb,
    /// A 'function'
    kFunction,
    /// A 'i32'
    kI32,
    /// A 'if'
    kIf,
    /// A 'image'
    kImage,
    /// A 'import'
    kImport,
    /// A 'in'
    kIn,
    /// A 'let'
    kLet,
    /// A 'loop'
    kLoop,
    /// A 'mat2x2'
    kMat2x2,
    /// A 'mat2x3'
    kMat2x3,
    /// A 'mat2x4'
    kMat2x4,
    /// A 'mat3x2'
    kMat3x2,
    /// A 'mat3x3'
    kMat3x3,
    /// A 'mat3x4'
    kMat3x4,
    /// A 'mat4x2'
    kMat4x2,
    /// A 'mat4x3'
    kMat4x3,
    /// A 'mat4x4'
    kMat4x4,
    /// A 'out'
    kOut,
    /// A 'private'
    kPrivate,
    /// A 'ptr'
    kPtr,
    /// A 'return'
    kReturn,
    /// A 'sampler'
    kSampler,
    /// A 'sampler_comparison'
    kComparisonSampler,
    /// A 'storage'
    kStorage,
    /// A 'struct'
    kStruct,
    /// A 'switch'
    kSwitch,
    /// A 'texture_depth_2d'
    kTextureDepth2d,
    /// A 'texture_depth_2d_array'
    kTextureDepth2dArray,
    /// A 'texture_depth_cube'
    kTextureDepthCube,
    /// A 'texture_depth_cube_array'
    kTextureDepthCubeArray,
    /// A 'texture_external'
    kTextureExternal,
    /// A 'texture_multisampled_2d'
    kTextureMultisampled2d,
    /// A 'texture_1d'
    kTextureSampled1d,
    /// A 'texture_2d'
    kTextureSampled2d,
    /// A 'texture_2d_array'
    kTextureSampled2dArray,
    /// A 'texture_3d'
    kTextureSampled3d,
    /// A 'texture_cube'
    kTextureSampledCube,
    /// A 'texture_cube_array'
    kTextureSampledCubeArray,
    /// A 'texture_storage_1d'
    kTextureStorage1d,
    /// A 'texture_storage_2d'
    kTextureStorage2d,
    /// A 'texture_storage_2d_array'
    kTextureStorage2dArray,
    /// A 'texture_storage_3d'
    kTextureStorage3d,
    /// A 'true'
    kTrue,
    /// A 'type'
    kType,
    /// A 'u32'
    kU32,
    /// A 'uniform'
    kUniform,
    /// A 'var'
    kVar,
    /// A 'vec2'
    kVec2,
    /// A 'vec3'
    kVec3,
    /// A 'vec4'
    kVec4,
    /// A 'workgroup'
    kWorkgroup,
  };

  /// Converts a token type to a name
  /// @param type the type to convert
  /// @returns the token type as as string
  static std::string TypeToName(Type type);

  /// Creates an uninitialized token
  Token();
  /// Create a Token
  /// @param type the Token::Type of the token
  /// @param source the source of the token
  Token(Type type, const Source& source);

  /// Create a string Token
  /// @param type the Token::Type of the token
  /// @param source the source of the token
  /// @param val the source string for the token
  Token(Type type, const Source& source, const std::string& val);
  /// Create a unsigned integer Token
  /// @param source the source of the token
  /// @param val the source unsigned for the token
  Token(const Source& source, uint32_t val);
  /// Create a signed integer Token
  /// @param source the source of the token
  /// @param val the source integer for the token
  Token(const Source& source, int32_t val);
  /// Create a float Token
  /// @param source the source of the token
  /// @param val the source float for the token
  Token(const Source& source, float val);
  /// Move constructor
  Token(Token&&);
  /// Copy constructor
  Token(const Token&);
  ~Token();

  /// Assignment operator
  /// @param b the token to copy
  /// @return Token
  Token& operator=(const Token& b);

  /// Returns true if the token is of the given type
  /// @param t the type to check against.
  /// @returns true if the token is of type `t`
  bool Is(Type t) const { return type_ == t; }

  /// @returns true if the token is uninitialized
  bool IsUninitialized() const { return type_ == Type::kUninitialized; }
  /// @returns true if the token is reserved
  bool IsReservedKeyword() const { return type_ == Type::kReservedKeyword; }
  /// @returns true if the token is an error
  bool IsError() const { return type_ == Type::kError; }
  /// @returns true if the token is EOF
  bool IsEof() const { return type_ == Type::kEOF; }
  /// @returns true if the token is an identifier
  bool IsIdentifier() const { return type_ == Type::kIdentifier; }
  /// @returns true if the token is a float
  bool IsFloatLiteral() const { return type_ == Type::kFloatLiteral; }
  /// @returns true if the token is an signed int
  bool IsSintLiteral() const { return type_ == Type::kSintLiteral; }
  /// @returns true if the token is a unsigned int
  bool IsUintLiteral() const { return type_ == Type::kUintLiteral; }

  /// @returns true if token is a '&'
  bool IsAnd() const { return type_ == Type::kAnd; }
  /// @returns true if token is a '&&'
  bool IsAndAnd() const { return type_ == Type::kAndAnd; }
  /// @returns true if token is a '->'
  bool IsArrow() const { return type_ == Type::kArrow; }
  /// @returns true if token is a '[['
  bool IsAttrLeft() const { return type_ == Type::kAttrLeft; }
  /// @returns true if token is a ']]'
  bool IsAttrRight() const { return type_ == Type::kAttrRight; }
  /// @returns true if token is a '/'
  bool IsForwardSlash() const { return type_ == Type::kForwardSlash; }
  /// @returns true if token is a '!'
  bool IsBang() const { return type_ == Type::kBang; }
  /// @returns true if token is a '['
  bool IsBracketLeft() const { return type_ == Type::kBracketLeft; }
  /// @returns true if token is a ']'
  bool IsBracketRight() const { return type_ == Type::kBracketRight; }
  /// @returns true if token is a '{'
  bool IsBraceLeft() const { return type_ == Type::kBraceLeft; }
  /// @returns true if token is a '}'
  bool IsBraceRight() const { return type_ == Type::kBraceRight; }
  /// @returns true if token is a ':'
  bool IsColon() const { return type_ == Type::kColon; }
  /// @returns true if token is a ','
  bool IsComma() const { return type_ == Type::kComma; }
  /// @returns true if token is a '='
  bool IsEqual() const { return type_ == Type::kEqual; }
  /// @returns true if token is a '=='
  bool IsEqualEqual() const { return type_ == Type::kEqualEqual; }
  /// @returns true if token is a '>'
  bool IsGreaterThan() const { return type_ == Type::kGreaterThan; }
  /// @returns true if token is a '>='
  bool IsGreaterThanEqual() const { return type_ == Type::kGreaterThanEqual; }
  /// @returns true if token is a '>>'
  bool IsShiftRight() const { return type_ == Type::kShiftRight; }
  /// @returns true if token is a '<'
  bool IsLessThan() const { return type_ == Type::kLessThan; }
  /// @returns true if token is a '<='
  bool IsLessThanEqual() const { return type_ == Type::kLessThanEqual; }
  /// @returns true if token is a '<<'
  bool IsShiftLeft() const { return type_ == Type::kShiftLeft; }
  /// @returns true if token is a '%'
  bool IsMod() const { return type_ == Type::kMod; }
  /// @returns true if token is a '-'
  bool IsMinus() const { return type_ == Type::kMinus; }
  /// @returns true if token is a '!='
  bool IsNotEqual() const { return type_ == Type::kNotEqual; }
  /// @returns true if token is a '.'
  bool IsPeriod() const { return type_ == Type::kPeriod; }
  /// @returns true if token is a '+'
  bool IsPlus() const { return type_ == Type::kPlus; }
  /// @returns true if token is a '|'
  bool IsOr() const { return type_ == Type::kOr; }
  /// @returns true if token is a '||'
  bool IsOrOr() const { return type_ == Type::kOrOr; }
  /// @returns true if token is a '('
  bool IsParenLeft() const { return type_ == Type::kParenLeft; }
  /// @returns true if token is a ')'
  bool IsParenRight() const { return type_ == Type::kParenRight; }
  /// @returns true if token is a ';'
  bool IsSemicolon() const { return type_ == Type::kSemicolon; }
  /// @returns true if token is a '*'
  bool IsStar() const { return type_ == Type::kStar; }
  /// @returns true if token is a '^'
  bool IsXor() const { return type_ == Type::kXor; }

  /// @returns true if token is a 'array'
  bool IsArray() const { return type_ == Type::kArray; }
  /// @returns true if token is a 'bitcast'
  bool IsBitcast() const { return type_ == Type::kBitcast; }
  /// @returns true if token is a 'bool'
  bool IsBool() const { return type_ == Type::kBool; }
  /// @returns true if token is a 'break'
  bool IsBreak() const { return type_ == Type::kBreak; }
  /// @returns true if token is a 'case'
  bool IsCase() const { return type_ == Type::kCase; }
  /// @returns true if token is a 'sampler_comparison'
  bool IsComparisonSampler() const { return type_ == Type::kComparisonSampler; }
  /// @returns true if token is a 'continue'
  bool IsContinue() const { return type_ == Type::kContinue; }
  /// @returns true if token is a 'continuing'
  bool IsContinuing() const { return type_ == Type::kContinuing; }
  /// @returns true if token is a 'discard'
  bool IsDiscard() const { return type_ == Type::kDiscard; }
  /// @returns true if token is a 'default'
  bool IsDefault() const { return type_ == Type::kDefault; }
  /// @returns true if token is a 'else'
  bool IsElse() const { return type_ == Type::kElse; }
  /// @returns true if token is a 'elseif'
  bool IsElseIf() const { return type_ == Type::kElseIf; }
  /// @returns true if token is a 'f32'
  bool IsF32() const { return type_ == Type::kF32; }
  /// @returns true if token is a 'fallthrough'
  bool IsFallthrough() const { return type_ == Type::kFallthrough; }
  /// @returns true if token is a 'false'
  bool IsFalse() const { return type_ == Type::kFalse; }
  /// @returns true if token is a 'fn'
  bool IsFn() const { return type_ == Type::kFn; }
  /// @returns true if token is a 'for'
  bool IsFor() const { return type_ == Type::kFor; }
  /// @returns true if token is a 'Bgra8Unorm' format
  bool IsFormatBgra8Unorm() const { return type_ == Type::kFormatBgra8Unorm; }
  /// @returns true if token is a 'Bgra8UnormSrgb' format
  bool IsFormatBgra8UnormSrgb() const {
    return type_ == Type::kFormatBgra8UnormSrgb;
  }
  /// @returns true if token is a 'R16Float' format
  bool IsFormatR16Float() const { return type_ == Type::kFormatR16Float; }
  /// @returns true if token is a 'R16Sint' format
  bool IsFormatR16Sint() const { return type_ == Type::kFormatR16Sint; }
  /// @returns true if token is a 'R16Uint' format
  bool IsFormatR16Uint() const { return type_ == Type::kFormatR16Uint; }
  /// @returns true if token is a 'R32Float' format
  bool IsFormatR32Float() const { return type_ == Type::kFormatR32Float; }
  /// @returns true if token is a 'R32Sint' format
  bool IsFormatR32Sint() const { return type_ == Type::kFormatR32Sint; }
  /// @returns true if token is a 'R32Uint' format
  bool IsFormatR32Uint() const { return type_ == Type::kFormatR32Uint; }
  /// @returns true if token is a 'R8Sint' format
  bool IsFormatR8Sint() const { return type_ == Type::kFormatR8Sint; }
  /// @returns true if token is a 'R8Snorm' format
  bool IsFormatR8Snorm() const { return type_ == Type::kFormatR8Snorm; }
  /// @returns true if token is a 'R8Uint' format
  bool IsFormatR8Uint() const { return type_ == Type::kFormatR8Uint; }
  /// @returns true if token is a 'R8Unorm' format
  bool IsFormatR8Unorm() const { return type_ == Type::kFormatR8Unorm; }
  /// @returns true if token is a 'Rg11B10Float' format
  bool IsFormatRg11B10Float() const {
    return type_ == Type::kFormatRg11B10Float;
  }
  /// @returns true if token is a 'Rg16Float' format
  bool IsFormatRg16Float() const { return type_ == Type::kFormatRg16Float; }
  /// @returns true if token is a 'Rg16Sint' format
  bool IsFormatRg16Sint() const { return type_ == Type::kFormatRg16Sint; }
  /// @returns true if token is a 'Rg16Uint' format
  bool IsFormatRg16Uint() const { return type_ == Type::kFormatRg16Uint; }
  /// @returns true if token is a 'Rg32Float' format
  bool IsFormatRg32Float() const { return type_ == Type::kFormatRg32Float; }
  /// @returns true if token is a 'Rg32Sint' format
  bool IsFormatRg32Sint() const { return type_ == Type::kFormatRg32Sint; }
  /// @returns true if token is a 'Rg32Uint' format
  bool IsFormatRg32Uint() const { return type_ == Type::kFormatRg32Uint; }
  /// @returns true if token is a 'Rg8Sint' format
  bool IsFormatRg8Sint() const { return type_ == Type::kFormatRg8Sint; }
  /// @returns true if token is a 'Rg8Snorm' format
  bool IsFormatRg8Snorm() const { return type_ == Type::kFormatRg8Snorm; }
  /// @returns true if token is a 'Rg8Uint' format
  bool IsFormatRg8Uint() const { return type_ == Type::kFormatRg8Uint; }
  /// @returns true if token is a 'Rg8Unorm' format
  bool IsFormatRg8Unorm() const { return type_ == Type::kFormatRg8Unorm; }
  /// @returns true if token is a 'Rgb10A2Unorm' format
  bool IsFormatRgb10A2Unorm() const {
    return type_ == Type::kFormatRgb10A2Unorm;
  }
  /// @returns true if token is a 'Rgba16Float' format
  bool IsFormatRgba16Float() const { return type_ == Type::kFormatRgba16Float; }
  /// @returns true if token is a 'Rgba16Sint' format
  bool IsFormatRgba16Sint() const { return type_ == Type::kFormatRgba16Sint; }
  /// @returns true if token is a 'Rgba16Uint' format
  bool IsFormatRgba16Uint() const { return type_ == Type::kFormatRgba16Uint; }
  /// @returns true if token is a 'Rgba32Float' format
  bool IsFormatRgba32Float() const { return type_ == Type::kFormatRgba32Float; }
  /// @returns true if token is a 'Rgba32Sint' format
  bool IsFormatRgba32Sint() const { return type_ == Type::kFormatRgba32Sint; }
  /// @returns true if token is a 'Rgba32Uint' format
  bool IsFormatRgba32Uint() const { return type_ == Type::kFormatRgba32Uint; }
  /// @returns true if token is a 'Rgba8Sint' format
  bool IsFormatRgba8Sint() const { return type_ == Type::kFormatRgba8Sint; }
  /// @returns true if token is a 'Rgba8Snorm' format
  bool IsFormatRgba8Snorm() const { return type_ == Type::kFormatRgba8Snorm; }
  /// @returns true if token is a 'Rgba8Uint' format
  bool IsFormatRgba8Uint() const { return type_ == Type::kFormatRgba8Uint; }
  /// @returns true if token is a 'Rgba8Unorm' format
  bool IsFormatRgba8Unorm() const { return type_ == Type::kFormatRgba8Unorm; }
  /// @returns true if token is a 'Rgba8UnormSrgb' format
  bool IsFormatRgba8UnormSrgb() const {
    return type_ == Type::kFormatRgba8UnormSrgb;
  }
  /// @returns true if token is a 'function'
  bool IsFunction() const { return type_ == Type::kFunction; }
  /// @returns true if token is a 'i32'
  bool IsI32() const { return type_ == Type::kI32; }
  /// @returns true if token is a 'if'
  bool IsIf() const { return type_ == Type::kIf; }
  /// @returns true if token is a 'image'
  bool IsImage() const { return type_ == Type::kImage; }
  /// @returns true if token is a 'import'
  bool IsImport() const { return type_ == Type::kImport; }
  /// @returns true if token is a 'in'
  bool IsIn() const { return type_ == Type::kIn; }
  /// @returns true if token is a 'let'
  bool IsLet() const { return type_ == Type::kLet; }
  /// @returns true if token is a 'loop'
  bool IsLoop() const { return type_ == Type::kLoop; }
  /// @returns true if token is a 'mat2x2'
  bool IsMat2x2() const { return type_ == Type::kMat2x2; }
  /// @returns true if token is a 'mat2x3'
  bool IsMat2x3() const { return type_ == Type::kMat2x3; }
  /// @returns true if token is a 'mat2x4'
  bool IsMat2x4() const { return type_ == Type::kMat2x4; }
  /// @returns true if token is a 'mat3x2'
  bool IsMat3x2() const { return type_ == Type::kMat3x2; }
  /// @returns true if token is a 'mat3x3'
  bool IsMat3x3() const { return type_ == Type::kMat3x3; }
  /// @returns true if token is a 'mat3x4'
  bool IsMat3x4() const { return type_ == Type::kMat3x4; }
  /// @returns true if token is a 'mat4x2'
  bool IsMat4x2() const { return type_ == Type::kMat4x2; }
  /// @returns true if token is a 'mat4x3'
  bool IsMat4x3() const { return type_ == Type::kMat4x3; }
  /// @returns true if token is a 'mat4x4'
  bool IsMat4x4() const { return type_ == Type::kMat4x4; }
  /// @returns true if token is a 'out'
  bool IsOut() const { return type_ == Type::kOut; }
  /// @returns true if token is a 'private'
  bool IsPrivate() const { return type_ == Type::kPrivate; }
  /// @returns true if token is a 'ptr'
  bool IsPtr() const { return type_ == Type::kPtr; }
  /// @returns true if token is a 'return'
  bool IsReturn() const { return type_ == Type::kReturn; }
  /// @returns true if token is a 'sampler'
  bool IsSampler() const { return type_ == Type::kSampler; }
  /// @returns true if token is a 'storage'
  bool IsStorage() const { return type_ == Type::kStorage; }
  /// @returns true if token is a 'struct'
  bool IsStruct() const { return type_ == Type::kStruct; }
  /// @returns true if token is a 'switch'
  bool IsSwitch() const { return type_ == Type::kSwitch; }
  /// @returns true if token is a 'texture_depth_2d'
  bool IsTextureDepth2d() const { return type_ == Type::kTextureDepth2d; }
  /// @returns true if token is a 'texture_depth_2d_array'
  bool IsTextureDepth2dArray() const {
    return type_ == Type::kTextureDepth2dArray;
  }
  /// @returns true if token is a 'texture_depth_cube'
  bool IsTextureDepthCube() const { return type_ == Type::kTextureDepthCube; }
  /// @returns true if token is a 'texture_depth_cube_array'
  bool IsTextureDepthCubeArray() const {
    return type_ == Type::kTextureDepthCubeArray;
  }
  /// @returns true if the token is a 'texture_multisample_2d'
  bool IsTextureMultisampled2d() const {
    return type_ == Type::kTextureMultisampled2d;
  }
  /// @returns true if token is a 'texture_storage_1d'
  bool IsTextureStorage1d() const { return type_ == Type::kTextureStorage1d; }
  /// @returns true if token is a 'texture_storage_2d'
  bool IsTextureStorage2d() const { return type_ == Type::kTextureStorage2d; }
  /// @returns true if token is a 'texture_storage_2d_array'
  bool IsTextureStorage2dArray() const {
    return type_ == Type::kTextureStorage2dArray;
  }
  /// @returns true if token is a 'texture_storage_3d'
  bool IsTextureStorage3d() const { return type_ == Type::kTextureStorage3d; }
  /// @returns true if token is a 'texture_1d'
  bool IsTextureSampled1d() const { return type_ == Type::kTextureSampled1d; }
  /// @returns true if token is a 'texture_2d'
  bool IsTextureSampled2d() const { return type_ == Type::kTextureSampled2d; }
  /// @returns true if token is a 'texture_2d_array'
  bool IsTextureSampled2dArray() const {
    return type_ == Type::kTextureSampled2dArray;
  }
  /// @returns true if token is a 'texture_3d'
  bool IsTextureSampled3d() const { return type_ == Type::kTextureSampled3d; }
  /// @returns true if token is a 'texture_cube'
  bool IsTextureSampledCube() const {
    return type_ == Type::kTextureSampledCube;
  }
  /// @returns true if token is a 'texture_cube_array'
  bool IsTextureSampledCubeArray() const {
    return type_ == Type::kTextureSampledCubeArray;
  }
  /// @returns true if token is a 'true'
  bool IsTrue() const { return type_ == Type::kTrue; }
  /// @returns true if token is a 'type'
  bool IsType() const { return type_ == Type::kType; }
  /// @returns true if token is a 'u32'
  bool IsU32() const { return type_ == Type::kU32; }
  /// @returns true if token is a 'uniform'
  bool IsUniform() const { return type_ == Type::kUniform; }
  /// @returns true if token is a 'var'
  bool IsVar() const { return type_ == Type::kVar; }
  /// @returns true if token is a 'vec2'
  bool IsVec2() const { return type_ == Type::kVec2; }
  /// @returns true if token is a 'vec3'
  bool IsVec3() const { return type_ == Type::kVec3; }
  /// @returns true if token is a 'vec4'
  bool IsVec4() const { return type_ == Type::kVec4; }
  /// @returns true if token is a 'workgroup'
  bool IsWorkgroup() const { return type_ == Type::kWorkgroup; }

  /// @returns the source information for this token
  Source source() const { return source_; }

  /// Returns the string value of the token
  /// @return const std::string&
  std::string to_str() const;
  /// Returns the float value of the token. 0 is returned if the token does not
  /// contain a float value.
  /// @return float
  float to_f32() const;
  /// Returns the uint32 value of the token. 0 is returned if the token does not
  /// contain a unsigned integer value.
  /// @return uint32_t
  uint32_t to_u32() const;
  /// Returns the int32 value of the token. 0 is returned if the token does not
  /// contain a signed integer value.
  /// @return int32_t
  int32_t to_i32() const;

  /// @returns the token type as string
  std::string to_name() const { return Token::TypeToName(type_); }

 private:
  /// The Token::Type of the token
  Type type_ = Type::kError;
  /// The source where the token appeared
  Source source_;
  /// The string represented by the token
  std::string val_str_;
  /// The signed integer represented by the token
  int32_t val_int_ = 0;
  /// The unsigned integer represented by the token
  uint32_t val_uint_ = 0;
  /// The float value represented by the token
  float val_float_ = 0.0;
};

#ifndef NDEBUG
inline std::ostream& operator<<(std::ostream& out, Token::Type type) {
  out << Token::TypeToName(type);
  return out;
}
#endif  // NDEBUG

}  // namespace wgsl
}  // namespace reader
}  // namespace tint

#endif  // SRC_READER_WGSL_TOKEN_H_
