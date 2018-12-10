use ident::{Ident, Label};
use std::fmt::{Debug, Display};
use tree;

pub trait MachineInstr {
    type UseIterator: Iterator<Item = Ident>;
    type DefIterator: Iterator<Item = Ident>;
    type TargetIterator: Iterator<Item = Label>;

    fn uses(&self) -> Self::UseIterator;

    fn defs(&self) -> Self::DefIterator;

    fn is_fall_through(&self) -> bool;

    fn jumps(&self) -> Self::TargetIterator;

    fn is_move_between_temps(&self) -> Option<(Ident, Ident)>;

    fn is_label(&self) -> Option<Label>;

    fn rename(&mut self, sigma: &Fn(Ident) -> Ident);
}

pub trait MachineFunction<A: MachineInstr>: Debug {
    fn name(&self) -> &Label;
    fn body(&self) -> &Vec<A>;
    fn spill(&mut self, to_spill: &[Ident]);
    fn rename(&mut self, sigma: &Fn(Ident) -> Ident);
}

pub trait MachinePrg<A: MachineInstr, F: MachineFunction<A>>: Debug + Display {
    fn functions(&self) -> &Vec<F>;
    fn functions_mut(&mut self) -> &mut Vec<F>;
}

pub trait Backend {
    type Instr: MachineInstr;
    type Function: MachineFunction<Self::Instr>;
    type Prg: MachinePrg<Self::Instr, Self::Function>;

    fn code_gen(c: &tree::Prg) -> Self::Prg;
}
