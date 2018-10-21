extern crate unicode_xid;
#[macro_use] extern crate lalrpop_util;
pub mod ast;
mod lexer;
lalrpop_mod!(pub straightline); // synthesized by LALRPOP

use lexer::Tokenizer;


fn main() {
    let example = "x = 2;\
        y = (print(x), 3);\
        z = (print(y, x), x+y) ;\
        print (z)";
    let ast = straightline::StmParser::new().parse(Tokenizer::new(example, 0));

    println!("{:?}", ast);
}
