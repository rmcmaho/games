import System.Console.Haskeline
import System.Console.ANSI
import System.IO
import Control.Monad.Trans

import GameBoard

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

setupBoard = outputStr $ show initialBoard
    
main = do
    runInputT defaultSettings setupBoard
    runInputT defaultSettings loop