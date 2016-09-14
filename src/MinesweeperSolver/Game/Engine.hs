module MinesweeperSolver.Game.Engine
    ( Cell (..)
    , Board (..)
    , Engine (..)
    ) where

data Cell
    = Covered
    | Flag
    | Empty
    | Mine
    | Digit Int
    deriving (Show, Eq, Ord)

type Board = [[Cell]]

data Engine = Engine
    { solution  :: Board
    , board     :: Board
    , width     :: Int
    , height    :: Int
    } deriving (Show)
