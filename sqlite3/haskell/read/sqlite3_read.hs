-- ---------------------------------------------------------------------
--	 sqlite3_read.hs
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
	putStrLn "*** 開始 ***"
	av01<-getArgs
	putStr $ unlines av01
	let db_file=head av01
--
	conn <- connectSqlite3 db_file
	sql_read_proc conn
	disconnect conn
	putStrLn "*** 終了 ***"
-- ---------------------------------------------------------------------
