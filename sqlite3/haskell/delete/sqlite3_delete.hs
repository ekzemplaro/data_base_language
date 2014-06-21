-- ---------------------------------------------------------------------
--	 sqlite3_delete.hs
--
--					Oct/15/2012
--
-- ---------------------------------------------------------------------
import System.Environment
import Database.HDBC
import Database.HDBC.Sqlite3

import Sql_manipulate
-- ---------------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***\n"
	av01<-getArgs
	putStr $ unlines av01
	let db_file=head av01
	let key_in=head (tail av01)
	print (key_in)
	print av01
--
	conn <- connectSqlite3 db_file
	sql_delete_proc conn key_in
	disconnect conn
	putStrLn "*** 終了 ***"
-- ---------------------------------------------------------------------
