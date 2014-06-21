-- ---------------------------------------------------------------------
--	 postgre_read.hs
--
--					Oct/15/2012
--
-- ---------------------------------------------------------------------
import System.Environment
import Database.HDBC
import Database.HDBC.PostgreSQL

import Sql_manipulate
-- ---------------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
--
	conn <- connectPostgreSQL
	  "host=localhost port=5432 dbname=city user=scott password=tiger"
	sql_read_proc conn
	disconnect conn
	putStrLn "*** 終了 ***"
-- ---------------------------------------------------------------------
