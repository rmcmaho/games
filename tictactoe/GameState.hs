module GameState
( GameState
, initialState
, renderBoard
, setCursor
, resetCursor
, moveCursorUp
, moveCursorDown
) where

import System.Console.ANSI
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

resetCursor (GameState _ (CursorPosition x y)) = cursorUpLine (5-(2*y))

setCursor (GameState _ (CursorPosition x y)) = cursorUpLine (1+(2*y))

moveCursorUp (GameState board (CursorPosition x y)) = GameState board (CursorPosition x (y+1))

moveCursorDown (GameState board (CursorPosition x y)) = GameState board (CursorPosition x (y-1))
