module GameState
( initialState
) where

import GameBoard

type XPosition = Int
type YPosition = Int
type CursorPosition = (XPosition,YPosition)

data GameState = GameState { board :: GameBoard
                           , cursor :: CursorPosition
                           }

initialCursor :: CursorPosition
initialCursor = (0,0)

initialState :: GameState
initialState = GameState { board = initialBoard, cursor = initialCursor }