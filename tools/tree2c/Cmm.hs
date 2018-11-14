{-
 - Translation of tree programs to C.
 -}
module Cmm(
  cmmDoc
) where

import Prelude hiding (EQ,GT,LT,(<>))
import qualified Data.Set as Set
import Text.PrettyPrint
import Names
import Tree

tempsExp :: Exp -> Set.Set Temp
tempsExp (CONST _) = Set.empty
tempsExp (NAME _) = Set.empty
tempsExp (TEMP t) = Set.singleton t
tempsExp (PARAM _) = Set.empty
tempsExp (BINOP _ e1 e2) = (tempsExp e1) `Set.union` (tempsExp e2)
tempsExp (MEM e) = tempsExp e
tempsExp (CALL f as) = (tempsExp f) `Set.union` Set.unions (map tempsExp as)
tempsExp (ESEQ s e) = tempsStm s `Set.union` (tempsExp e)

tempsStm :: Stm -> Set.Set Temp
tempsStm (MOVE d s) = (tempsExp d) `Set.union` (tempsExp s)
tempsStm (JUMP e _) = tempsExp e
tempsStm (CJUMP _ e1 e2 _ _) = (tempsExp e1) `Set.union` (tempsExp e2)
tempsStm (SEQ ss) = Set.unions (map tempsStm ss)
tempsStm (LABEL _) = Set.empty

cmmBinOp :: BinOp -> String
cmmBinOp PLUS = "+"
cmmBinOp MINUS = "-"
cmmBinOp MUL = "*"
cmmBinOp DIV = "/"
cmmBinOp AND = "&"
cmmBinOp OR = "|"
cmmBinOp LSHIFT = "<<"
cmmBinOp RSHIFT = ">>"
cmmBinOp ARSHIFT = error "ARSHIFT unsupported"
cmmBinOp XOR = "^"

cmmRelOp :: RelOp -> String
cmmRelOp EQ = "=="
cmmRelOp NE = "!="
cmmRelOp LT = "<"
cmmRelOp GT = ">"
cmmRelOp LE = "<="
cmmRelOp GE = ">="
cmmRelOp ULT = error "ULT unsupported"
cmmRelOp ULE = error "ULE unsupported"
cmmRelOp UGT = error "UGT unsupported"
cmmRelOp UGE = error "UGE unsupported"

declVar :: Temp -> Doc -> Doc
declVar t e = text "int32_t" <+> text (show t) <+> equals <+> e <> semi

param :: Integer -> Temp
param i = mkNamedTemp $ "p" ++ show i

-- returns (s,e), where
-- s is a C statement and e is a pure C-expression
cmmExp :: MonadNameGen m => Exp -> m (Doc, Doc)
cmmExp (CONST i) = return (empty, integer (fromIntegral i))
cmmExp (NAME l) = return (empty, text "(int32_t)" <> text l)
cmmExp (TEMP t) = return (empty, text (show t))
cmmExp (PARAM i) = return (empty, text $ show $ param i)
cmmExp (BINOP o e1 e2) =
  do (s, [ce1, ce2]) <- cmmExpSeq [e1, e2]
     return (s, parens (ce1 <+> text (cmmBinOp o) <+> ce2))
cmmExp (MEM e) =
  do (s, ce) <- cmmExp e
     return (s, text "MEM" <> parens ce)
cmmExp (CALL (NAME l) as) =
  do (sl, cel) <- cmmExpSeq as
     t <- nextTemp
     return (sl $$ declVar t (text l <> (parens $ hsep $ punctuate comma cel)),
             text $ show t)
cmmExp (CALL _ _) =  error "CALL only implemented for named functions"
cmmExp (ESEQ s e) =
  do cs <- cmmStm s
     (cse, ce) <- cmmExp e
     return (cs $$ cse, ce)

cmmExpSeq :: MonadNameGen m => [Exp] -> m (Doc, [Doc])
cmmExpSeq [] = return (empty, [])
cmmExpSeq (e:es) =
  do (cs, ce) <- cmmExp e
     (css, ces) <- cmmExpSeq es
     if isEmpty css then
       return (cs $$ css, ce:ces)
      else
       do t <- nextTemp
          return (vcat [cs, declVar t ce, css]
                 , text (show t) : ces)

cmmStmWithComments :: MonadNameGen m => Stm -> m Doc
cmmStmWithComments (SEQ ss) =
  do css <- mapM cmmStmWithComments ss
     return $ vcat css
cmmStmWithComments s =
  do cs <- cmmStm s
     return $ text ("/* " ++ show s ++ " */") $$ cs

cmmStm :: MonadNameGen m => Stm -> m Doc
cmmStm (MOVE (TEMP t) s) =
  do (ss, cs) <- cmmExp s
     return $ ss $$ (text (show t) <+> equals <+> cs <> semi)
cmmStm (MOVE (PARAM i) s) =
  do (ss, cs) <- cmmExp s
     return $ ss $$ (text (show (param i)) <+> equals <+> cs <> semi)
cmmStm (MOVE (MEM d) s) =
  do (sd, cd) <- cmmExp d
     t <- nextTemp
     (ss, cs) <- cmmExp s
     return $ vcat [ sd, declVar t cd, ss
                   , text "MEM" <> parens (text $ show t) <+> equals <+> cs <> semi]
cmmStm (MOVE (ESEQ ds d) s) = cmmStm (SEQ [ds, MOVE d s])
cmmStm e@(MOVE _ _) = error $ "Left-hand side of MOVE must be TEMP, MEM or ESEQ: " ++ show e
cmmStm (JUMP (NAME l) _) = return $ text "goto" <+> text l <> semi
cmmStm (JUMP _ _) = error "JUMP only implemented for named locations"
cmmStm (CJUMP r e1 e2 lt lf) =
  do (s, [ce1, ce2]) <- cmmExpSeq [e1, e2]
     return $ s $$
              (text "if"
               <+> parens (ce1 <+> text (cmmRelOp r) <+> ce2)
               <+> text "goto" <+> text lt <> semi
               <+> text "else"
               <+> text "goto" <+> text lf <> semi)
cmmStm (SEQ ss) =
  do css <- mapM cmmStm ss
     return $ vcat css
cmmStm (LABEL l) = return $ text l <> colon <+> semi

cmmMethod :: Method -> Doc
cmmMethod m  =
  runNameGen $
    let params = map param [0 .. nparams m - 1]
        paramdecls = parens $ hsep $ punctuate comma
                            $ map (\p -> text "int32_t" <+> text (show p)) params
        headtext = text "int32_t" <+> text (methodname m) <+> paramdecls
        temps = tempsStm (SEQ $ body m) `Set.union` Set.singleton (returnTemp m)
        locvars = Set.toList temps
        locvardecls =
          if null locvars then empty
          else text "int32_t" <+> hsep (punctuate comma (map (text.show) locvars))
                              <> semi
    in do avoid (Set.toList temps ++ params)
          bodytext <- cmmStmWithComments (SEQ $ body m)
          return $ vcat [ headtext <+> lbrace
                        , locvardecls
                        , bodytext
                        , text ("return " ++ show (returnTemp m)) <> semi
                        , rbrace
                        , text ""
                        ]

cmmDecl :: Method -> Doc
cmmDecl m =
  let params = map param [0 .. nparams m - 1]
      paramdecls = parens $ hsep $ punctuate comma
                          $ map (\p -> text "int32_t" <+> text (show p)) params
  in (text "int32_t" <+> text (methodname m) <+> paramdecls <+> semi) $$ text ""

cmmDoc :: Prg -> Doc
cmmDoc prg =
   vcat $ [ text "#include <stdint.h>"
          , text "#define MEM(x) *((int32_t*)(x))"
          , text ""
          , text "int32_t L_halloc(int32_t size);"
          , text "int32_t L_println_int(int32_t n);"
          , text "int32_t L_write(int32_t n);"
          , text "int32_t L_read();"
          , text "int32_t L_raise(int32_t rc);"
          ]
          ++ map cmmDecl (methods prg)
          ++ map cmmMethod (methods prg)
