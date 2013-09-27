import System.Console.Haskeline
import System.IO
import Control.Monad.Trans

import GameState

changeStateOnInput :: GameState -> Maybe Char -> Maybe GameState
changeStateOnInput gameState input =
        case input of
            Just 'q' -> Nothing
            Just 'w' -> Just $ moveCursorUp gameState
            Just 's' -> Just $ moveCursorDown gameState
            _ -> Nothing

loop gameState = 
    let newState input = changeStateOnInput gameState input
    in
    do
    outputStr $ renderBoard gameState
    liftIO $ setCursor gameState
    input <- getInputChar ""
    liftIO $ resetCursor gameState
    case (newState input) of
        Nothing -> return ()
        Just state -> loop state

main = do
    runInputT defaultSettings (loop initialState)