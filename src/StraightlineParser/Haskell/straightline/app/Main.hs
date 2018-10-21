module Main where
  
import Lexer
import Parser
import Ast

main :: IO ()
main = 
  let example = "x = 2; y = (print(x), 3); z = (print(y, x), x+y); print (z)"
      ast = parse (alexScanTokens example)
  in putStr (show ast)