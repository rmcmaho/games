module GameState
( initialBoard
, renderGameBoard
) where

data BoardPosition = PlayerOne | PlayerTwo | Empty
type BoardRow = (BoardPosition,BoardPosition,BoardPosition)
type GameBoard = (BoardRow,BoardRow,BoardRow)

instance Show BoardPosition where
    show PlayerOne = "X"
    show PlayerTwo = "O"
    show Empty = "."

renderGameRow :: BoardRow -> String
renderGameRow (pos1,pos2,pos3) = show pos1 ++ "|" ++ show pos2 ++ "|" ++ show pos3 ++ "\n"

renderRowSeperator :: String
renderRowSeperator = "- - -\n"

renderGameBoard :: GameBoard -> String
renderGameBoard (row1, row2, row3) =
    renderGameRow row1 ++
    renderRowSeperator ++
    renderGameRow row2 ++
    renderRowSeperator ++
    renderGameRow row3

initialRow :: BoardRow
initialRow = (Empty,Empty,Empty)

initialBoard :: GameBoard
initialBoard = ( initialRow
               , initialRow
               , initialRow
               )

type XPosition = Int
type YPosition = Int
type CursorPosition = (XPosition,YPosition)

data GameState = GameState { board :: GameBoard
                           , cursor :: CursorPosition
                           }