module MinesweeperSolver.Game.State
    ( GameIO
    , GameStateM
    ) where

import MinesweeperSolver.Game.Engine

import Control.Monad.State

type GameIO a = StateT Engine IO a
type GameStateM a = State Engine a
