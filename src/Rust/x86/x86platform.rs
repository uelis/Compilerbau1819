use backend::Platform;
use intermediate::tree;
use x86::x86function::X86Function;
use x86::x86instr::X86Instr;
use x86::x86prg::X86Prg;

#[derive(Copy, Clone)]
pub struct X86Platform {}

impl Platform for X86Platform {
    type Reg = X86Register;
    type Instr = X86Instr;
    type Function = X86Function;
    type Prg = X86Prg;

    fn code_gen(prg: &tree::Prg) -> X86Prg {
        panic!("TODO")
    }
}
