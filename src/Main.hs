module Main where

import MinesweeperSolver.Game
import MinesweeperSolver.Reader

import System.Console.ArgParser
import System.Console.Readline
import System.Environment

data OptParser = OptParser { filename :: String }
    deriving (Show)

parser :: ParserSpec OptParser
parser = OptParser
    `parsedBy` reqPos "filename" `Descr` "the file containing the board to print"

argumentParser :: IO (CmdLnInterface OptParser)
argumentParser =
    (`setAppDescr` "A constraint solver for Minesweeper.")
    <$> mkApp parser

main :: IO ()
main = do
    interface <- argumentParser
    runApp interface optionHandler

optionHandler :: OptParser -> IO ()
optionHandler args = do
    engine <- readEngineFromFile (filename args)
    runGame engine

runGame :: Engine -> IO ()
runGame e = do
    print e

-- getFileNameAndEngine :: IO (Maybe Engine)
-- getFileNameAndEngine = do
--     input <- readline "filename> "
--     case input of
--         Nothing
--             -> do
--                 putStrLn ""
--                 return (Nothing)
--         Just filename
--             -> do
--                 engine <- readEngineFromFile filename
--                 return (Just engine)
