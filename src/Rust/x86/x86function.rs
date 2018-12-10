use backend;
use ident::{Ident, Label};
use x86::X86Instr;

#[derive(Debug)]
pub struct X86Function {
    pub name: Label,
    pub body: Vec<X86Instr>,
    locals_in_stack: usize,
}

impl X86Function {
    pub fn new(name: Label, body: Vec<X86Instr>) -> X86Function {
        X86Function {
            name: name,
            body: body,
            locals_in_stack: 0,
        }
    }
}

impl backend::MachineFunction<X86Instr> for X86Function {
    fn name(&self) -> &Label {
        &self.name
    }

    fn body(&self) -> &Vec<X86Instr> {
        &self.body
    }

    fn spill(&mut self, _to_spill: &[Ident]) {
        panic!("needed later for register allocation")
    }

    fn rename(&mut self, _sigma: &Fn(Ident) -> Ident) {
        panic!("needed later for register allocation")
    }
}
