use std::fmt::{Debug, Display, Error, Formatter};
use x86::x86instr;
use x86::{X86Function, X86Prg};

impl Display for x86instr::UnaryInstr {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        Debug::fmt(self, fmt)
    }
}

impl Display for x86instr::BinaryInstr {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        Debug::fmt(self, fmt)
    }
}

impl Display for x86instr::JumpCond {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        Debug::fmt(self, fmt)
    }
}

impl Display for x86instr::Scale {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        use self::x86instr::Scale::*;
        match *self {
            S1 => write!(fmt, "1"),
            S2 => write!(fmt, "2"),
            S4 => write!(fmt, "4"),
            S8 => write!(fmt, "8"),
        }
    }
}

impl Display for x86instr::EffectiveAddress {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        match (self.base, self.index_scale) {
            (None, None) => write!(fmt, "{}", self.displacement),
            (None, Some((i, s))) => write!(fmt, "{}*{} + {}", i, s, self.displacement),
            (Some(b), None) => write!(fmt, "{} + {}", b, self.displacement),
            (Some(b), Some((i, s))) => write!(fmt, "{} + {}*{} + {}", b, i, s, self.displacement),
        }
    }
}

impl Display for x86instr::Operand {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        use self::x86instr::Operand::*;
        match *self {
            Imm(n) => write!(fmt, "{}", n),
            Reg(i) => write!(fmt, "{}", i),
            Mem(i) => write!(fmt, "DWORD PTR [{}]", i),
        }
    }
}

impl Display for x86instr::X86Instr {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        use self::x86instr::X86Instr::*;
        match *self {
            Unary(i, ref o) => write!(fmt, "{} {}", i, o),
            Binary(b, ref o1, ref o2) => write!(fmt, "{} {} , {}", b, o1, o2),
            Label(ref l) => write!(fmt, "{}:", l),
            JMP(ref l) => write!(fmt, "JMP {}", l),
            CALL(ref l) => write!(fmt, "CALL {}", l),
            J(ref c, ref l) => write!(fmt, "J{} {}", c, l),
            RET => write!(fmt, "RET"),
        }
    }
}

impl Display for X86Function {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        use backend::MachineFunction;
        write!(fmt, "{}:\n", self.name())?;
        for i in self.body() {
            writeln!(fmt, "{}", i)?
        }
        Ok(())
    }
}

impl Display for X86Prg {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        writeln!(fmt, "  .intel_syntax")?;
        writeln!(fmt, "  .global Lmain")?;
        for f in &self.functions {
            writeln!(fmt, "{}\n", f)?
        }
        Ok(())
    }
}
