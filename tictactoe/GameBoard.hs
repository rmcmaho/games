module GameBoard
( GameBoard
, initialBoard
) where

data BoardPosition = PlayerOne | PlayerTwo | Empty
data BoardRow = BoardRow BoardPosition BoardPosition BoardPosition | Separator
data GameBoard = GameBoard BoardRow BoardRow BoardRow

instance Show BoardPosition where
    show PlayerOne = "X"
    show PlayerTwo = "O"
    show Empty = "."

instance Show BoardRow where
    show (BoardRow pos1 pos2 pos3) = show pos1 ++ "|" ++ show pos2 ++ "|" ++ show pos3 ++ "\n"
    show Separator = "- - -\n"

instance Show GameBoard where
    show (GameBoard row1 row2 row3) =
        show row1 ++
        show Separator ++
        show row2 ++
        show Separator ++
        show row3

initialRow :: BoardRow
initialRow = BoardRow Empty Empty Empty

initialBoard :: GameBoard
initialBoard = GameBoard initialRow initialRow initialRow