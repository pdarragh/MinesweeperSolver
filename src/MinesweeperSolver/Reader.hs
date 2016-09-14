module MinesweeperSolver.Reader
    ( readEngineFromFile
    , buildCell
    ) where

import MinesweeperSolver.Game.Engine
import MinesweeperSolver.Game.State

readEngineFromFile :: String -> IO (Engine)
readEngineFromFile filename = do
    raw_contents <- readFile filename
    return (buildEngine raw_contents)

buildEngine :: String -> Engine
buildEngine raw_engine =
    let
        contents = lines raw_engine
        dimensions = getDimensions (head contents)
        rows = (fst dimensions)
        cols = (snd dimensions)
        solution = buildBoard (tail contents)
        board = replicate rows (replicate cols Covered)
    in Engine solution board rows cols

getDimensions :: String -> (Int, Int)
getDimensions dimensions =
    case words dimensions of
        [] -> error "No dimensions given"
        [s] ->
            let
                sv = (read :: String -> Int) s
            in (sv, sv)
        [c, r] ->
            let
                cv = (read :: String -> Int) c
                rv = (read :: String -> Int) r
            in (cv, rv)

buildBoard :: [String] -> Board
buildBoard = map ((map buildCell) . words)

buildCell :: String -> Cell
buildCell l = case l of
    "#" -> Covered
    "+" -> Flag
    "_" -> Empty
    "*" -> Mine
    n   ->
        let v = (read :: String -> Int) n
        in
            if ((1 <= v) && (v <= 9)) then
                Digit v
            else
                error ("Invalid flag parameter: " ++ n)
