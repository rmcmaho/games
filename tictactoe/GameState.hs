module GameState
( initialState
, renderBoard
) where

import GameBoard

type XPosition = Int
type YPosition = Int
data CursorPosition = CursorPosition XPosition YPosition

data GameState = GameState { board :: GameBoard
                           , cursor :: CursorPosition
                           }

initialCursor :: CursorPosition
initialCursor = CursorPosition 0 0

initialState :: GameState
initialState = GameState initialBoard initialCursor

renderBoard :: GameState -> String
renderBoard gameState = show $ board gameState