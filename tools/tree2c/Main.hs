module Main where

import System.Environment
import System.Console.GetOpt
import Text.PrettyPrint

import Lex
import Parse
import Cmm

usage :: [String] -> IO a
usage _ = ioError (userError header)
  where header = "Usage: tree2c <file>"

readFileFromCmdLine :: [String] -> IO String
readFileFromCmdLine argv = do
  let (_, ns, _) = getOpt Permute [] argv
  case ns of
    [] -> getContents
    [prgFile] -> readFile prgFile
    _ -> usage [""]

main :: IO ()
main = do
  cmdLine  <- getArgs
  input <- readFileFromCmdLine cmdLine
  let defs = parse (alexScanTokens input)
  let cmm = cmmDoc defs
  putStrLn $ render cmm
