#! /usr/bin/runghc
-- ---------------------------------------------------------------------
--	 postgre_delete.hs
--
--					Dec/12/2014
--
-- ---------------------------------------------------------------------
import System.Environment
import Database.HDBC
import Database.HDBC.PostgreSQL

import Sql_manipulate
-- ---------------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***\n"
	av01<-getArgs
	putStr $ unlines av01
	let key_in=head av01
	print (key_in)
	print av01
--
	conn <- connectPostgreSQL
		"host=localhost port=5432 dbname=city user=scott password=tiger"
	sql_delete_proc conn key_in
	disconnect conn
	putStrLn "*** 終了 ***"
-- ---------------------------------------------------------------------
