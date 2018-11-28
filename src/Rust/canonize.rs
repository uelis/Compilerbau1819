use ident::Ident;
use tree::*;

pub fn canonize_prg(p: Prg) -> Prg {
    let mut cm = Vec::new();
    for m in p.functions {
        cm.push(canonize_fun(m))
    }
    Prg {
        functions: cm,
    }
}

fn canonize_fun(m: Function) -> Function {
    let mut cbody = Vec::new();
    for s in m.body {
        cbody.append(&mut canonize_stm(s))
    }
    Function {
        name: m.name,
        nparams: m.nparams,
        body: cbody,
        ret: m.ret, // is temp, need not be canonized
    }
}

fn canonize_stm(s: Stm) -> Vec<Stm> {
    use tree::Exp::*;
    use tree::Stm::*;
    match s {
        Move(e1, e2) => {
            match e1 {
                Mem(a) => {
                    let b1 = canonize_exp_no_top_call(*a);
                    let b2 = canonize_exp(e2);
                    Block::combine_stm(b1, b2, &|a, e2| Move(Mem(Box::new(a)), e2))
                }
                Temp(t) => {
                    let mut b = canonize_exp(e2);
                    b.stms.push(Move(Temp(t), b.exp));
                    b.stms
                }
                Param(i) => {
                    let mut b = canonize_exp(e2);
                    b.stms.push(Move(Param(i), b.exp));
                    b.stms
                }
                ESeq(mut s, e) => {
                    s.push(Move(*e, e2));
                    canonize_stm(Seq(s))
                }
                _ => unreachable!(),
            }
        }
        Jump(e, ids) => {
            let mut b = canonize_exp_no_top_call(e);
            b.stms.push(Jump(b.exp, ids));
            b.stms
        }
        CJump(o, e1, e2, t1, t2) => {
            let b1 = canonize_exp_no_top_call(e1);
            let b2 = canonize_exp_no_top_call(e2);
            Block::combine_stm(b1, b2, &|e1, e2| CJump(o, e1, e2, t1, t2))
        }
        Seq(ss) => {
            let mut cs = Vec::new();
            for s in ss {
                cs.append(&mut canonize_stm(s))
            }
            cs
        }
        Label(i) => vec![Label(i)],
    }
}

fn canonize_exp_no_top_call(e: Exp) -> Block {
    use tree::Exp::*;
    let mut b = canonize_exp(e);
    match b.exp {
        Call(f, args) => {
            let i = Ident::new();
            b.stms.push(Stm::Move(Temp(i), Call(f, args)));
            b.exp = Temp(i);
            b
        }
        _ => b,
    }
}

fn canonize_exp(e: Exp) -> Block {
    use tree::Exp::*;
    match e {
        Const(i) => Block::new_exp(Const(i)),
        Name(n) => Block::new_exp(Name(n)),
        Temp(x) => Block::new_exp(Temp(x)),
        Param(i) => Block::new_exp(Param(i)),
        Mem(e) => {
            let mut b = canonize_exp_no_top_call(*e);
            b.exp = Mem(Box::new(b.exp));
            b
        }
        BinOp(o, e1, e2) => {
            let b1 = canonize_exp_no_top_call(*e1);
            let b2 = canonize_exp_no_top_call(*e2);
            Block::combine(b1, b2, &|e1, e2| BinOp(o, Box::new(e1), Box::new(e2)))
        }
        Call(e, mut args) => {
            let b = canonize_exp_no_top_call(*e);
            let mut bs = Vec::new();
            args.reverse();
            for a in args {
                bs.push(canonize_exp_no_top_call(a));
            }
            Block::combine_n(b, bs, &|e, es| Call(Box::new(e), es))
        }
        ESeq(ss, e) => {
            let mut cs = Vec::new();
            for s in ss {
                cs.append(&mut canonize_stm(s))
            }
            Block::new(cs, *e)
        }
    }
}

struct Block {
    stms: Vec<Stm>,
    exp: Exp,
}

impl Block {
    fn new(s: Vec<Stm>, e: Exp) -> Block {
        Block { stms: s, exp: e }
    }

    fn new_exp(e: Exp) -> Block {
        Block {
            stms: Vec::new(),
            exp: e,
        }
    }

    fn commutes(_: &Stm, e: &Exp) -> bool {
        match *e {
            Exp::Name(_) => true,
            Exp::Const(_) => true,
            _ => false,
        }
    }

    fn commute(ss: &Vec<Stm>, e: &Exp) -> bool {
        for s in ss {
            if !Block::commutes(s, e) {
                return false;
            }
        }
        true
    }

    fn compose(mut b: Block, ss: &mut Vec<Stm>) -> Block {
        if Block::commute(&ss, &b.exp) {
            b.stms.append(ss);
            b
        } else {
            let i = Ident::new();
            let m = Stm::Move(Exp::Temp(i), b.exp);
            b.stms.push(m);
            b.stms.append(ss);
            b.exp = Exp::Temp(i);
            b
        }
    }

    fn combine(b1: Block, mut b2: Block, f: &Fn(Exp, Exp) -> Exp) -> Block {
        let mut b = Block::compose(b1, &mut b2.stms);
        b.exp = f(b.exp, b2.exp);
        b
    }

    fn combine_n(b: Block, mut bs: Vec<Block>, f: &Fn(Exp, Vec<Exp>) -> Exp) -> Block {
        bs.reverse();
        let mut ss = vec![];
        let mut es = vec![];
        for b in bs {
            let b1 = Block::compose(b, &mut ss);
            ss = b1.stms;
            es.push(b1.exp)
        }
        let mut b1 = Block::compose(b, &mut ss);
        b1.exp = f(b1.exp, es);
        b1
    }

    fn combine_stm(b1: Block, mut b2: Block, f: &Fn(Exp, Exp) -> Stm) -> Vec<Stm> {
        let mut b = Block::compose(b1, &mut b2.stms);
        b.stms.push(f(b.exp, b2.exp));
        b.stms
    }
}
