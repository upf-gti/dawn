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

#ifndef SRC_TINT_LANG_CORE_IR_EXIT_H_
#define SRC_TINT_LANG_CORE_IR_EXIT_H_

#include "src/tint/lang/core/ir/terminator.h"
#include "src/tint/utils/containers/const_propagating_ptr.h"

// Forward declarations
namespace tint::core::ir {
class ControlInstruction;
}  // namespace tint::core::ir

namespace tint::core::ir {

/// The base class for all exit terminators.
class Exit : public Castable<Exit, Terminator> {
  public:
    /// Constructor
    /// @param id the instruction id
    explicit Exit(Instruction::Id id);

    ~Exit() override;

    /// @copydoc Value::Destroy
    void Destroy() override;

    /// @return the control instruction that this exit is associated with
    ir::ControlInstruction* ControlInstruction() { return ctrl_inst_; }

    /// @return the control instruction that this exit is associated with
    const ir::ControlInstruction* ControlInstruction() const { return ctrl_inst_; }

  protected:
    /// Sets control instruction that this exit is associated with
    /// @param ctrl_inst the new ControlInstruction that this exit is associated with
    void SetControlInstruction(ir::ControlInstruction* ctrl_inst);

  private:
    ConstPropagatingPtr<ir::ControlInstruction> ctrl_inst_;
};

}  // namespace tint::core::ir

#endif  // SRC_TINT_LANG_CORE_IR_EXIT_H_
