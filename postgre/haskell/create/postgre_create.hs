#! /usr/bin/runghc
-- ---------------------------------------------------------------------
--	 postgre_create.hs
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
	putStrLn "The arguments are:"
	av01<-getArgs
	putStr $ unlines av01
	putStrLn "\n*** aaaa ***"
	let db_file=head av01
	print av01
--
	let dict_aa = data_prepare_proc
--
	conn <- connectPostgreSQL
		"host=localhost port=5432 dbname=city user=scott password=tiger"

	drop_proc conn
	create_proc conn
--
	mapM (insert_proc conn) dict_aa
--
	commit conn
	disconnect conn
	putStrLn "*** 終了 ***"

-- ---------------------------------------------------------------------
data_prepare_proc :: [([Char], [([Char], [Char])])]
data_prepare_proc =
		[("t3461",[
			("name","広島"),
			("population","91726"),
			("date_mod","1960-8-11")]),
		("t3462",[
			("name","福山"),
			("population","74281"),
			("date_mod","1960-9-15")]),
		("t3463",[
			("name","東広島"),
			("population","29358"),
			("date_mod","1960-2-24")]),
		("t3464",[
			("name","呉"),
			("population","58427"),
			("date_mod","1960-9-8")]),
		("t3465",[
			("name","尾道"),
			("population","27354"),
			("date_mod","1960-1-9")]),
		("t3466",[
			("name","竹原"),
			("population","81426"),
			("date_mod","1960-5-14")]),
		("t3467",[
			("name","三次"),
			("population","97352"),
			("date_mod","1960-8-21")]),
		("t3468",[
			("name","大竹"),
			("population","54921"),
			("date_mod","1960-5-7")]),
		("t3469",[
			("name","府中"),
			("population","84625"),
			("date_mod","1960-10-12")])
		]
-- ---------------------------------------------------------------------
