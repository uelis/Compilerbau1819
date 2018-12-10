{
module ParseIntel  where

import Data.Int

import Names
import Intel
import TokenIntel hiding (Label, Temp, Reg)
import qualified TokenIntel as Tok
import LexIntel
}

%tokentype { (Token AlexPosn) }

%name parse

%token
        '['             { Token LBrack _ }
        ']'             { Token RBrack _ }
        ':'             { Token Colon _ }
        ','             { Token Comma _ }
        '+'             { Token Plus _ }
        '-'             { Token Minus _ }
        '*'             { Token Times _ }
        '0'             { Token (Nat 0) _ }
        '1'             { Token (Nat 1) _ }
        '2'             { Token (Nat 2) _ }
        '4'             { Token (Nat 4) _ }
        '8'             { Token (Nat 8) _ }

        mov             { Token Mov _ }
        add             { Token Add _ }
        sub             { Token Sub _ }
        shl             { Token Shl _ }
        shr             { Token Shr _ }
        sal             { Token Sal _ }
        sar             { Token Sar _ }
        and             { Token And _ }
        or              { Token Or _ }
        xor             { Token Xor _ }
        neg             { Token Neg _ }
        not             { Token Not _ }
        inc             { Token Inc _ }
        dec             { Token Dec _ }
        pop             { Token Pop _ }
        push            { Token Push _ }
        imul            { Token Imul _ }
        idiv            { Token Idiv _ }
        jmp             { Token Jmp _ }
        lea             { Token Lea _ }
        cmp             { Token Cmp _ }
        cdq             { Token Cdq _ }
        je              { Token Je _  }
        jne             { Token Jne _ }
        jl              { Token Jl _ }
        jle             { Token Jle _ }
        jg              { Token Jg _ }
        jge             { Token Jge _ }
        call            { Token Call _ }
        ret             { Token Ret _ }
        enter           { Token Enter _ }
        leave           { Token Leave _ }
        nop             { Token Nop _ }

        dword           { Token Dword _ }
        ptr             { Token Ptr _ }

        nat             { Token (Nat $$) _ }
        temp            { Token (Tok.Temp $$) _ }
        reg             { Token (Tok.Reg $$) _ }
        id              { Token (Id $$) _ }

%%

-- a function starts with a label and ends with "ret"

IList :: { [Instr] }
IList :                { [ ] }
      | Instr IList       { $1 : $2 }

Instr :: { Instr }
Instr : Label             { LABEL $1 }
      | DS Dest ',' Src   { DS $1 $2 $4 }
      | D  Dest           { D  $1 $2 }
      | lea Reg ',' dword ptr '[' Addr ']'  { LEA $2 $7 }
      | cmp Dest ',' Src  { CMP $2 $4 }
      | push Src          { PUSH $2 }
      | imul Reg ',' Src  { DS IMUL2 (Reg $2) $4 } -- Dest because no Imm
      | imul Dest         { IMUL $2 }     -- Dest because no Imm
      | idiv Dest         { IDIV $2 }     -- Dest because no Imm
      | jmp  label        { JMP  (Symbolic $2) }
      | CJmp label        { J $1 (Symbolic $2) }
      | call label        { CALL (Symbolic $2) }
      | enter Nat ',' '0' { ENTER $2 }
      | cdq               { CDQ }
      | leave             { LEAVE }
      | nop               { NOP }
      | ret               { RET }

-- a Label ends in a colon

Label :: { Label }
Label : label ':'         { $1 }

-- instruction taking both destination and source

DS :: { DS }
DS    : mov               { MOV }
      | add               { ADD }
      | sub               { SUB }
      | shl               { SHL }
      | shr               { SHR }
      | sal               { SAL }
      | sar               { SAR }
      | and               { AND }
      | or                { OR  }
      | xor               { XOR }

-- instruction taking only destination

D :: { D }
D     : pop               { POP }
      | neg               { NEG }
      | not               { NOT }
      | inc               { INC }
      | dec               { DEC }

-- conditional jump

CJmp :: { Cond }
CJmp  : je                { E  }
      | jne               { NE }
      | jl                { L  }
      | jle               { LE }
      | jg                { G  }
      | jge               { GE }

-- operands

Src :: { Src }
Src   : Int               { Imm $1  }
      | Dest              { Dest $1 }

Dest :: { Dest }
Dest  : Reg               { Reg $1 }
      | dword ptr '[' Addr ']'  { Mem $4 }

Reg :: { Reg }
Reg   : reg               { Fixed $1 }
      | temp              { Flex (Temp $1) }

Addr :: { EA }
Addr  : Reg                             { EA $1 Nothing Nothing 0 }

      | Reg '+' Int                     { EA $1 Nothing Nothing $3 }
      | Reg '+' Reg                     { EA $1 Nothing (Just $3) 0 }
      | Int '+' Reg                     { EA $3 Nothing Nothing $1 }

      | Reg '+' Reg '+' Int             { EA $1 Nothing (Just $3) $5 }
      | Reg '+' Int '+' Reg             { EA $1 Nothing (Just $5) $3 }
      | Int '+' Reg '+' Reg             { EA $3 Nothing (Just $5) $1 }

      | Reg '*' Scl                     { EA $1 (Just $3) Nothing 0 }
      | Scl '*' Reg                     { EA $3 (Just $1) Nothing 0 }

      | Reg '*' Scl '+' Int             { EA $1 (Just $3) Nothing $5 }
      | Scl '*' Reg '+' Int             { EA $3 (Just $1) Nothing $5 }
      | Reg '*' Scl '+' Reg             { EA $1 (Just $3) (Just $5) 0 }
      | Scl '*' Reg '+' Reg             { EA $3 (Just $1) (Just $5) 0 }

      | Int '+' Reg '*' Scl             { EA $3 (Just $5) Nothing $1 }
      | Int '+' Scl '*' Reg             { EA $5 (Just $3) Nothing $1 }
      | Reg '+' Reg '*' Scl             { EA $3 (Just $5) (Just $1) 0 }
      | Reg '+' Scl '*' Reg             { EA $5 (Just $3) (Just $1) 0 }

      | Reg '*' Scl '+' Int '+' Reg     { EA $1 (Just $3) (Just $7) $5 }
      | Scl '*' Reg '+' Int '+' Reg     { EA $3 (Just $1) (Just $7) $5 }
      | Reg '*' Scl '+' Reg '+' Int     { EA $1 (Just $3) (Just $5) $7 }
      | Scl '*' Reg '+' Reg '+' Int     { EA $3 (Just $1) (Just $5) $7 }

      | Int '+' Reg '*' Scl '+' Reg     { EA $3 (Just $5) (Just $7) $1 }
      | Int '+' Scl '*' Reg '+' Reg     { EA $5 (Just $3) (Just $7) $1 }
      | Reg '+' Reg '*' Scl '+' Int     { EA $3 (Just $5) (Just $1) $7 }
      | Reg '+' Scl '*' Reg '+' Int     { EA $5 (Just $3) (Just $1) $7 }

      | Reg '+' Int '+' Reg '*' Scl     { EA $5 (Just $7) (Just $1) $3 }
      | Reg '+' Int '+' Scl '*' Reg     { EA $7 (Just $5) (Just $1) $3 }
      | Int '+' Reg '+' Reg '*' Scl     { EA $5 (Just $7) (Just $3) $1 }
      | Int '+' Reg '+' Scl '*' Reg     { EA $7 (Just $5) (Just $3) $1 }

-- negative displacement

      | Reg '-' Int                     { EA $1 Nothing Nothing (- $3) }

      | Reg '+' Reg '-' Int             { EA $1 Nothing (Just $3) (- $5) }
      | Reg '-' Int '+' Reg             { EA $1 Nothing (Just $5) (- $3) }

      | Reg '*' Scl '-' Int             { EA $1 (Just $3) Nothing (- $5) }
      | Scl '*' Reg '-' Int             { EA $3 (Just $1) Nothing (- $5) }

      | Reg '*' Scl '-' Int '+' Reg     { EA $1 (Just $3) (Just $7) (- $5) }
      | Scl '*' Reg '-' Int '+' Reg     { EA $3 (Just $1) (Just $7) (- $5) }
      | Reg '*' Scl '+' Reg '-' Int     { EA $1 (Just $3) (Just $5) (- $7) }
      | Scl '*' Reg '+' Reg '-' Int     { EA $3 (Just $1) (Just $5) (- $7) }

      | Reg '+' Reg '*' Scl '-' Int     { EA $3 (Just $5) (Just $1) (- $7) }
      | Reg '+' Scl '*' Reg '-' Int     { EA $5 (Just $3) (Just $1) (- $7) }

      | Reg '-' Int '+' Reg '*' Scl     { EA $5 (Just $7) (Just $1) (- $3) }
      | Reg '-' Int '+' Scl '*' Reg     { EA $7 (Just $5) (Just $1) (- $3) }


-- currently only support scaling by 4

Scl :: { Scale }
Scl   : '1'                         { S1 }
      | '2'                         { S2 }
      | '4'                         { S4 }
      | '8'                         { S8 }

Nat :: { Int32 }
Nat   : '0'                         { fromIntegral 0  }
      | '1'                         { fromIntegral 1  }
      | '2'                         { fromIntegral 2  }
      | '4'                         { fromIntegral 4  }
      | '8'                         { fromIntegral 8  }
      | nat                         { fromIntegral $1 }

Int :: { Int32 }
Int   : Nat                         { $1     }
      | '-' Nat                     { (- $2) }

label :: { Label}
label : id         { $1 }
      | temp       { "t" ++ (show $1) }

{

happyError :: [Token AlexPosn] -> a
happyError tks = error ("Parse error at " ++ lcn ++ "\n")
        where
        lcn =   case tks of
                  [] -> "end of file"
                  (tk:_) -> "line " ++ show l ++ ", column " ++ show c ++ " (token " ++ (show $ kind tk) ++ ")"
                        where AlexPn _ l c = token_pos tk

}
