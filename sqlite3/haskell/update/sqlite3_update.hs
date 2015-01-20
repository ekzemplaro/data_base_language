#! /usr/bin/runghc
-- ---------------------------------------------------------------------
--	 sqlite3_update.hs
--
--					Dec/24/2014
--
-- ---------------------------------------------------------------------
import System.Environment
import System.Time
import Database.HDBC
import Database.HDBC.Sqlite3

import Text_manipulate
import Sql_manipulate
-- ---------------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***\n"
	today <- get_current_date_proc
--
	putStrLn "The arguments are:"
	av01<-getArgs
	putStr $ unlines av01
	let db_file=head av01
	let key_in=head (tail av01)
	let population_in=head (tail (tail av01))
	print (key_in ++ " : " ++  population_in)
	print av01
--
	conn <- connectSqlite3 db_file
	sql_update_proc conn key_in population_in today
	disconnect conn
	putStrLn "*** 終了 ***"
-- ---------------------------------------------------------------------
