use backend;
use ident::{Ident, Label};

#[derive(Debug, Copy, Clone)]
pub enum UnaryInstr {
    PUSH,
    POP,
    NEG,
    NOT,
    INC,
    DEC,
    IDIV,
}

#[derive(Debug, Copy, Clone)]
pub enum BinaryInstr {
    MOV,
    ADD,
    SUB,
    SHL,
    SHR,
    SAL,
    SAR,
    AND,
    OR,
    XOR,
    TEST,
    CMP,
    LEA,
    IMUL,
}

#[derive(Debug, Copy, Clone)]
pub enum JumpCond {
    E,
    NE,
    L,
    LE,
    G,
    GE,
    Z,
}

#[derive(Debug, Copy, Clone)]
pub enum Scale {
    S1,
    S2,
    S4,
    S8,
}

#[derive(Debug, Copy, Clone)]
pub struct EffectiveAddress {
    pub base: Option<Ident>,
    pub index_scale: Option<(Ident, Scale)>,
    pub displacement: i32,
}

#[derive(Debug, Clone)]
pub enum Operand {
    Imm(i32),
    Reg(Ident),
    Mem(EffectiveAddress),
}

#[derive(Debug)]
pub enum X86Instr {
    Unary(UnaryInstr, Operand),
    Binary(BinaryInstr, Operand, Operand),
    Label(Label),
    JMP(Label),
    // only static calls needed for now
    CALL(Label),
    J(JumpCond, Label),
    RET,
}

impl EffectiveAddress {
    fn rename(&mut self, sigma: &Fn(Ident) -> Ident) {
        self.base = match self.base {
            None => None,
            Some(t) => Some(sigma(t)),
        };
        match self.index_scale {
            None => (),
            Some((i, s)) => self.index_scale = Some((sigma(i), s)),
        }
    }
}

pub struct TargetIterator(Option<Label>);

impl Iterator for TargetIterator {
    type Item = Label;
    fn next(&mut self) -> Option<Label> {
        match *self {
            TargetIterator(None) => None,
            TargetIterator(Some(l)) => {
                *self = TargetIterator(None);
                Some(l)
            }
        }
    }
}

impl backend::MachineInstr for X86Instr {
    // vector iterators are just one possibility here
    type UseIterator = ::std::vec::IntoIter<Ident>;
    type DefIterator = ::std::vec::IntoIter<Ident>;
    type TargetIterator = ::std::vec::IntoIter<Label>;

    fn uses(&self) -> Self::UseIterator {
        panic!("needed later for register allocation")
    }

    fn defs(&self) -> Self::DefIterator {
        panic!("needed later for register allocation")
    }

    fn is_fall_through(&self) -> bool {
        panic!("needed later for register allocation")
    }

    fn jumps(&self) -> Self::TargetIterator {
        panic!("needed later for register allocation")
    }

    fn is_move_between_temps(&self) -> Option<(Ident, Ident)> {
        panic!("needed later for register allocation")
    }

    fn is_label(&self) -> Option<Label> {
        panic!("needed later for register allocation")
    }

    fn rename(&mut self, _sigma: &Fn(Ident) -> Ident) {
        panic!("needed later for register allocation")
    }
}
