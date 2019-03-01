module Main(main) where

import Control.Monad

import System.Environment
import System.Exit
import System.IO
import System.Console.GetOpt

import LexIntel
import ParseIntel
import Sim hiding (print)

data Flag
  = Verbose
  | Help
    deriving (Eq, Show)

optDescrs :: [OptDescr Flag]
optDescrs =
  [ Option ['?'] ["help"]      (NoArg Help)    "show usage information"
  , Option ['v'] ["verbose"]   (NoArg Verbose) "be verbose (can be repeated)"
  ]

usage :: IO a
usage = do
  putStr $ usageInfo "Usage: symb386 [options] <file>" optDescrs
  exitFailure

-- | Extract the input file name from command line.
--   Display usage info for malformed command lines.
parseCmdLine :: [String] -> IO (String, Int)
parseCmdLine argv = do
  let (os, ns, _) = getOpt Permute optDescrs argv
  unless (length ns == 1)
    usage
  let prgFile = head ns
      verbose = length $ filter (Verbose==) os
  when (verbose > 0) $
    hPutStrLn stderr $ "Reading program from file: " ++ prgFile
  when (Help `elem` os) $
    ioError (userError "No execution with --help")
  return (prgFile, verbose)

exitOnError :: Either String b -> IO b
exitOnError = either crash return where crash a = putStrLn a >> exitFailure

main :: IO ()
main = do
  cmdLine <- getArgs
  (prgFile, verbose) <- parseCmdLine cmdLine
  input   <- readFile prgFile
  let instr = parse (alexScanTokens input)
  run verbose instr
