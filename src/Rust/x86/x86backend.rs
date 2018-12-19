use ident::Ident;
use tree;
use backend::Backend;
use x86::X86Instr;
use x86::X86Function;
use x86::X86Prg;

#[derive(Copy, Clone)]
pub struct X86Backend {}

impl Backend for X86Backend {
    type Instr = X86Instr;
    type Function = X86Function;
    type Prg = X86Prg;

    fn all_registers() -> Vec<Ident> {
      panic!("needed later for register allocation")
    }

    fn general_purpose_registers() -> Vec<Ident> {
      panic!("needed later for register allocation")
    }

    fn code_gen(_prg: &tree::Prg) -> X86Prg {
      panic!("instruction selection goes here")
    }
}
