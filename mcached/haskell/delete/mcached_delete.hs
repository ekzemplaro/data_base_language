#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	mcached_delete.hs
--
--						Feb/06/2015
--
-- -----------------------------------------------------------------
import System.Environment
import System.IO

import Mcache_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"
--
	args <- System.Environment.getArgs
	let key_in = head args
	let hostname = "localhost"
	let port = 11211
	putStr (key_in ++ "\n")
--	putStr (command ++ "\n")
--
	mcache_delete_proc hostname port key_in
--
	System.IO.putStrLn "*** 終了***"
--
-- -----------------------------------------------------------------
