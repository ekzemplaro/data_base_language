-- -----------------------------------------------------------------
--	mcachedb_delete.hs
--
--						Feb/11/2015
--
-- -----------------------------------------------------------------
import System.Environment
import System.IO
import Network
import Mcache_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
--
	args <- getArgs
	let key_in = head args
	putStr (key_in ++ "\n")
--
	let hostname = "host_ubuntu1"
	let port = 21201
--
	mcache_delete_proc hostname port key_in
--
	putStrLn "*** 終了***"
--
-- -----------------------------------------------------------------
