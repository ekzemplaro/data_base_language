#! /usr/bin/runghc
-- ---------------------------------------------------------------------
--	 postgre_update.hs
--
--					Dec/12/2014
--
-- ---------------------------------------------------------------------
import System.Environment
import Database.HDBC
import Database.HDBC.PostgreSQL
import System.Time

import Text_manipulate
import Sql_manipulate
-- ---------------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***\n"
--
	today <- get_current_date_proc
--
	av01<-getArgs
	putStr $ unlines av01
	putStrLn "\n*** bbbb ***"
	let key_in=head av01
	let population_in=head (tail av01)
	print (key_in ++ " : " ++  population_in)
	print av01
--
	conn <- connectPostgreSQL
		"host=localhost port=5432 dbname=city user=scott password=tiger"
--
	sql_update_proc conn key_in population_in today
--
	disconnect conn
	putStrLn "*** 終了 ***"
-- ---------------------------------------------------------------------
