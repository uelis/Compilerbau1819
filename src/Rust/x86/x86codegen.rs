use backend::CodeGen;
use ident::Ident;
use tree;
use x86::X86Function;
use x86::X86Instr;
use x86::X86Prg;

#[derive(Copy, Clone)]
pub struct X86CodeGen {}

impl CodeGen<X86Instr, X86Function, X86Prg> for X86CodeGen {
    fn all_registers() -> Vec<Ident> {
        panic!("needed later for register allocation")
    }

    fn general_purpose_registers() -> Vec<Ident> {
        panic!("needed later for register allocation")
    }

    fn code_gen(_prg: tree::Prg) -> X86Prg {
        panic!("instruction selection goes here")
    }
}
