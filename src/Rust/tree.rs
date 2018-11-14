use std::fmt;
use ident::{Ident, Label};

#[derive(Copy, Clone, Debug)]
pub enum BinOp {
    Plus,
    Minus,
    Mul,
    Div,
    And,
    Or,
    LShift,
    RShift,
    ARShift,
    Xor,
}

#[derive(Copy, Clone, Debug)]
pub enum RelOp {
    EQ,
    NE,
    LT,
    GT,
    LE,
    GE,
    ULT,
    ULE,
    UGT,
    UGE,
}

#[derive(Debug)]
pub enum Exp {
    Const(i32),
    Name(Label),
    Temp(Ident),
    Param(u32),
    Mem(Box<Exp>),
    BinOp(BinOp, Box<Exp>, Box<Exp>),
    Call(Box<Exp>, Vec<Exp>),
    ESeq(Vec<Stm>, Box<Exp>),
}

#[derive(Debug)]
pub enum Stm {
    Move(Exp, Exp),
    Jump(Exp, Vec<Label>),
    CJump(RelOp, Exp, Exp, Label, Label),
    Seq(Vec<Stm>),
    Label(Label),
}

#[derive(Debug)]
pub struct Function {
    pub name: Label,
    pub nparams: usize,
    pub body: Vec<Stm>,
    pub ret: Ident,
}

#[derive(Debug)]
pub struct Prg {
    pub functions: Vec<Function>,
}

macro_rules! jump {
($e:expr) => { Stm::Jump(Exp::Name($e), vec![$e]) }
}

impl RelOp {
    pub fn neg(&self) -> RelOp {
        use tree::RelOp::*;
        match *self {
            EQ => NE,
            NE => EQ,
            LT => GE,
            GT => LE,
            LE => GT,
            GE => LT,
            ULT => UGE,
            ULE => UGT,
            UGT => ULE,
            UGE => ULT,
        }
    }
}

impl fmt::Display for BinOp {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> Result<(), fmt::Error> {
        use self::BinOp::*;
        match *self {
            Plus => write!(fmt, "PLUS"),
            Minus => write!(fmt, "MINUS"),
            Mul => write!(fmt, "MUL"),
            Div => write!(fmt, "DIV"),
            And => write!(fmt, "AND"),
            Or => write!(fmt, "OR"),
            LShift => write!(fmt, "LSHIFT"),
            RShift => write!(fmt, "RSHIFT"),
            ARShift => write!(fmt, "ARSHIFT"),
            Xor => write!(fmt, "XOR"),
        }
    }
}

impl fmt::Display for RelOp {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> Result<(), fmt::Error> {
        use self::RelOp::*;
        match *self {
            EQ => write!(fmt, "EQ"),
            NE => write!(fmt, "NE"),
            LT => write!(fmt, "LT"),
            GT => write!(fmt, "GT"),
            LE => write!(fmt, "LE"),
            GE => write!(fmt, "GE"),
            ULT => write!(fmt, "ULT"),
            ULE => write!(fmt, "ULE"),
            UGT => write!(fmt, "UGT"),
            UGE => write!(fmt, "UGE"),
        }
    }
}


impl fmt::Display for Exp {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> Result<(), fmt::Error> {
        use self::Exp::*;
        match *self {
            Const(i) => write!(fmt, "CONST({})", i),
            Name(ref x) => {
                write!(fmt, "NAME({})", x)
            }
            Temp(ref x) => {
                write!(fmt, "TEMP({})", x)
            }
            Param(i) => write!(fmt, "PARAM({})", i),
            Mem(ref e) => {
                write!(fmt, "MEM({})", e)
            }
            BinOp(ref op, ref e1, ref e2) => {
                write!(fmt, "BINOP({}, {}, {})", op, e1, e2)
            }
            Call(ref ef, ref eargs) => {
                write!(fmt, "CALL({} ", ef)?;
                for arg in eargs {
                    write!(fmt, ", {}", arg)?;
                }
                write!(fmt, ")")
            }
            ESeq(ref ss, ref e) => {
                write!(fmt, "ESEQ(")?;
                for s in ss {
                    write!(fmt, "{}, ", s)?;
                }
                write!(fmt, "{})", e)
            }
        }
    }
}

impl fmt::Display for Stm {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> Result<(), fmt::Error> {
        use self::Stm::*;
        match *self {
            Move(ref e1, ref e2) => {
                write!(fmt, "MOVE({}, {})", e1, e2)
            }
            Jump(ref e, ref is) => {
                write!(fmt, "JUMP({}", e)?;
                for i in is {
                    write!(fmt, ", {}", i)?;
                }
                write!(fmt, ")")
            }
            CJump(ref op, ref e1, ref e2, ref l1, ref l2) => {
                write!(fmt, "CJUMP({}, {}, {}, {}, {})", op, e1, e2, l1, l2)
            }
            Seq(ref ss) => {
                write!(fmt, "SEQ(")?;
                let mut sep = "";
                for s in ss {
                    write!(fmt, "{}{}", sep, s)?;
                    sep = ", ";
                }
                write!(fmt, ")")
            }
            Label(ref l) => {
                write!(fmt, "LABEL({})", l)
            }
        }
    }
}

impl fmt::Display for Function {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> Result<(), fmt::Error> {
        writeln!(fmt, "{}({}){{", self.name, self.nparams)?;
        for s in &self.body {
            writeln!(fmt, "  {}", s)?;
        }
        writeln!(fmt, "return {}", self.ret)?;
        writeln!(fmt, "}}")
    }
}


impl fmt::Display for Prg {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> Result<(), fmt::Error> {
        for m in &self.functions {
            writeln!(fmt, "{}", m)?;
        }
        Ok(())
    }
}
