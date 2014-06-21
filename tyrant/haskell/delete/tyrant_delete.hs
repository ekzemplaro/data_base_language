-- -----------------------------------------------------------------
--	tyrant_delete.hs
--
--						Jan/27/2013
--
-- -----------------------------------------------------------------
import System.Environment
import System.IO
import Network
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
--
	args <- getArgs
	let key_in = head args
	let command = "delete " ++ key_in ++ "\r\n"
	let hostname = "localhost"
	putStr (key_in ++ "\n")
	putStr (command ++ "\n")
--
	withSocketsDo $ do 
        hSetBuffering stdout NoBuffering 
        h <- connectTo hostname (PortNumber 1978)
        hSetBuffering h LineBuffering
        hPutStrLn h command
        hGetLine h >>= putStrLn
        hClose h
--
	putStrLn "*** 終了***"
--
-- -----------------------------------------------------------------
