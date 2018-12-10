use backend::MachinePrg;
use x86::X86Function;
use x86::X86Instr;

#[derive(Debug)]
pub struct X86Prg {
    pub functions: Vec<X86Function>,
}

impl MachinePrg<X86Instr, X86Function> for X86Prg {
    fn functions(&self) -> &Vec<X86Function> {
        &self.functions
    }

    fn functions_mut(&mut self) -> &mut Vec<X86Function> {
        &mut self.functions
    }
}
