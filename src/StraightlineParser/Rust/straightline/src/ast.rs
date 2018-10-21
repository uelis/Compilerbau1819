#[derive(Debug)]
pub enum Stm<'a> {
    Seq(Box<Stm<'a>>, Box<Stm<'a>>),
    Assign(&'a str, Box<Exp<'a>>),
    Print(Vec<Exp<'a>>),
}

#[derive(Debug)]
pub enum Exp<'a> {
    Id(&'a str),
    Num(i32),
    Op(Box<Exp<'a>>, Binop, Box<Exp<'a>>),
    ESeq(Box<Stm<'a>>, Box<Exp<'a>>),
}

#[derive(Debug, Copy, Clone)]
pub enum Binop {
    Mul,
    Div,
    Add,
    Sub,
}
