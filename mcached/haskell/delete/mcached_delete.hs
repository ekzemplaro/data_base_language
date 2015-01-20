#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	mcached_delete.hs
--
--						Dec/26/2014
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
        h <- connectTo hostname (PortNumber 11211)
        hSetBuffering h LineBuffering
        hPutStrLn h command
        hGetLine h >>= putStrLn
        hClose h
--
	putStrLn "*** 終了***"
--
-- -----------------------------------------------------------------
