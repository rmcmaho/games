import System.Console.Haskeline

main = runInputT defaultSettings loop
    where 
        loop :: InputT IO ()
        loop = do
            minput <- getInputChar "% "
            case minput of
                Nothing -> return ()
                Just 'q' -> return ()
                Just input -> do outputStrLn $ "Input was: " ++ [input]
                                 loop