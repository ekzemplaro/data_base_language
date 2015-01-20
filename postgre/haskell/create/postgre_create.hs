#! /usr/bin/runghc
-- ---------------------------------------------------------------------
--	 postgre_create.hs
--
--					Dec/24/2014
--
-- ---------------------------------------------------------------------
import	System.Environment
import	Data.Map
import Database.HDBC
import Database.HDBC.PostgreSQL

import Text_manipulate
import Sql_manipulate
-- ---------------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***\n"
--
	let dict_aa = data_prepare_proc
--
	conn <- connectPostgreSQL
		"host=localhost port=5432 dbname=city user=scott password=tiger"

	drop_proc conn
	create_proc conn
--
	let list_aa = toList dict_aa
	mapM (insert_proc conn) list_aa
--
	commit conn
	disconnect conn
	putStrLn "*** 終了 ***"

-- ---------------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t3461",unit_gen_proc ["広島","19647","1960-9-14"]),
		("t3462",unit_gen_proc ["福山" ,"25836" ,"1960-2-12"]),
		("t3463",unit_gen_proc ["東広島" ,"35921" ,"1960-5-24"]),
		("t3464",unit_gen_proc ["呉" ,"42167" ,"1960-9-8"]),
		("t3465",unit_gen_proc ["尾道" ,"13854" ,"1960-1-9"]),
		("t3466",unit_gen_proc ["竹原" ,"37426" ,"1960-5-14"]),
		("t3467",unit_gen_proc ["三次" ,"73152" ,"1960-8-21"]),
		("t3468",unit_gen_proc ["大竹" ,"69721" ,"1960-5-7"]),
		("t3469",unit_gen_proc ["府中" ,"61395" ,"1960-10-12"])
		]
-- ---------------------------------------------------------------------
