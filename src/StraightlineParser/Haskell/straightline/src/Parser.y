{
module Parser where

import Lexer
import qualified Tokens
import Ast
}

%name parse
%tokentype { (Tokens.Token AlexPosn) }

%name parse

%token
  '('        { Tokens.Token Tokens.LPar _ }
  ')'        { Tokens.Token Tokens.RPar _ }
    print    { Tokens.Token Tokens.Print _ } 
    '='      { Tokens.Token Tokens.Eq _ } 
  '+'        { Tokens.Token Tokens.Plus _ }
  '-'        { Tokens.Token Tokens.Minus _ } 
  '*'        { Tokens.Token Tokens.Times _ }
  '/'        { Tokens.Token Tokens.Divide _ } 
  ','        { Tokens.Token Tokens.Comma _ }
  ';'        { Tokens.Token Tokens.Semicolon _ }
  integer    { Tokens.Token (Tokens.Num $$) _ }
  identifier { Tokens.Token (Tokens.Id $$) _ }

%right ';'
%left '+' '-'
%left '*' '/'

%%

Stm :: { Stm }
Stm:  
  Stm ';' Stm                    { SeqStm $1 $3 }
| identifier '=' Exp             { AssignStm $1 $3 }
| print '(' ExpList ')'          { PrintStm $3 }

Exp :: { Exp }
Exp: 
  identifier          { IdExp $1 }
| integer             { NumExp $1 }
| Exp '+' Exp         { OpExp $1 OpPlus $3 }
| Exp '-' Exp         { OpExp $1 OpMinus $3 }
| Exp '*' Exp         { OpExp $1 OpTimes $3 }
| Exp '/' Exp         { OpExp $1 OpDiv $3 }
| '(' Stm ',' Exp ')' { ESeqExp $2 $4 }

ExpList :: { [Exp] }
ExpList: 
  Exp                 { [$1] }
| Exp ',' ExpList     { $1:$3 }


{
happyError :: [Tokens.Token AlexPosn] -> a
happyError tks = error ("Parse error at " ++ lcn ++ "\n")
	where
	lcn = case tks of
		  [] -> "end of file"
		  (tk : _) -> "line " ++ show l ++ ", column " ++ show c
			where AlexPn _ l c = Tokens.token_pos tk
}
