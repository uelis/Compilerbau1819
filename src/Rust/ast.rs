#[derive(Debug, Copy, Clone)]
pub enum Binop {
    Add,
    Sub,
    Mul,
    Div,
    Lt,
    StrictAnd,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Type<'a> {
    Int,
    Void,
    Bool,
    Arr(Box<Type<'a>>),
    Class(&'a str),
}

#[derive(Debug)]
pub struct Prg<'a> {
    pub main_class: &'a str,
    pub main_throws_ioexception: bool,
    pub main_body: Stm<'a>,
    pub classes: Vec<ClassDecl<'a>>,
}

#[derive(Debug)]
pub struct ClassDecl<'a> {
    pub name: &'a str,
    pub fields: Vec<(&'a str, Type<'a>)>,
    pub methods: Vec<MethodDecl<'a>>,
}

#[derive(Debug)]
pub struct MethodDecl<'a> {
    pub name: &'a str,
    pub ret_type: Type<'a>,
    pub parameters: Vec<(&'a str, Type<'a>)>,
    pub throws_ioexception: bool,
    pub locals: Vec<(&'a str, Type<'a>)>,
    pub body: Stm<'a>,
    pub ret: Exp<'a>,
}

#[derive(Debug)]
pub enum Exp<'a> {
    Id(&'a str),
    Number(i32),
    Op(Box<Exp<'a>>, Binop, Box<Exp<'a>>),
    Invoke(Box<Exp<'a>>, &'a str, Vec<Exp<'a>>),
    ArrayGet(Box<Exp<'a>>, Box<Exp<'a>>),
    ArrayLength(Box<Exp<'a>>),
    True,
    False,
    This,
    New(&'a str),
    NewIntArray(Box<Exp<'a>>),
    Neg(Box<Exp<'a>>),
    Read()
}

#[derive(Debug)]
pub enum Stm<'a> {
    Assignment(&'a str, Box<Exp<'a>>),
    ArrayAssignment(&'a str, Box<Exp<'a>>, Box<Exp<'a>>),
    If(Box<Exp<'a>>, Box<Stm<'a>>, Box<Stm<'a>>),
    While(Box<Exp<'a>>, Box<Stm<'a>>),
    Write(Box<Exp<'a>>),
    Println(Box<Exp<'a>>),
    Seq(Vec<Stm<'a>>),
}
