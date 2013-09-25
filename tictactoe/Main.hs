import System.Console.Haskeline
import System.Console.ANSI
import System.IO
import Control.Monad.Trans

data BoardPosition = PlayerOne | PlayerTwo | Empty
type BoardRow = (BoardPosition,BoardPosition,BoardPosition)
type GameBoard = (BoardRow,BoardRow,BoardRow)

instance Show BoardPosition where
    show PlayerOne = "X"
    show PlayerTwo = "O"
    show Empty = "."

drawGameRow (pos1,pos2,pos3) = outputStrLn (show pos1 ++ show pos2 ++ show pos3)

drawRowSeperator = outputStrLn "- - -"

drawGameBoard :: GameBoard -> InputT IO ()
drawGameBoard (row1, row2, row3) = do
    drawGameRow row1
    drawRowSeperator
    drawGameRow row2
    drawRowSeperator
    drawGameRow row3

type XPosition = Int
type YPosition = Int
type CursorPosition = (XPosition,YPosition)

data GameState = GameState { board :: GameBoard
                           , cursor :: CursorPosition
                           }

prompt = do
        c <- getInputChar ""
        case c of
            Just 'q' -> return False
            Just 'w' -> do
                        liftIO $ cursorUpLine 2
                        prompt
            Just 's' -> do
                        liftIO $ cursorDownLine 1
                        prompt
            _ -> return False

loop = do
    result <- prompt
    if result then loop else return ()

printRow = outputStrLn ".|.|."
printSeparator = outputStrLn "- - -"
    
setupBoard = do
    printRow
    printSeparator
    printRow
    printSeparator
    printRow
    
main = do
    runInputT defaultSettings setupBoard
    runInputT defaultSettings loop