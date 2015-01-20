#! /usr/bin/runghc
-- ---------------------------------------------------------------------
--	 sqlite3_create.hs
--
--					Dec/24/2014
--
-- ---------------------------------------------------------------------
import	System.Environment
import	Data.Map
import	Database.HDBC
import	Database.HDBC.Sqlite3

import	Text_manipulate
import	Sql_manipulate
-- ---------------------------------------------------------------------
main :: IO ()
main = do
	Prelude.putStrLn "*** 開始 ***\n"
	putStrLn "The arguments are:"
	av01<-getArgs
	putStrLn $ unlines av01
	let db_file=head av01
	print av01
--
	let dict_aa = data_prepare_proc
--
	conn <- connectSqlite3 db_file

	drop_proc conn
	create_proc conn
--
	let list_aa = toList dict_aa
	mapM (insert_proc conn) list_aa
--
	commit conn
	disconnect conn
	Prelude.putStrLn "*** 終了 ***"
-- ---------------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t0711",unit_gen_proc ["郡山","28197","1960-3-11"]),
		("t0712",unit_gen_proc ["会津若松" ,"41236" ,"1960-8-15"]),
		("t0713",unit_gen_proc ["白河" ,"76358" ,"1960-5-24"]),
		("t0714",unit_gen_proc ["福島" ,"58417" ,"1960-9-8"]),
		("t0715",unit_gen_proc ["喜多方" ,"29354" ,"1960-1-9"]),
		("t0716",unit_gen_proc ["二本松" ,"83126" ,"1960-5-14"]),
		("t0717",unit_gen_proc ["いわき" ,"97352" ,"1960-8-21"]),
		("t0718",unit_gen_proc ["相馬" ,"56921" ,"1960-5-7"]),
		("t0719",unit_gen_proc ["須賀川" ,"89615" ,"1960-10-12"])
		]
-- ---------------------------------------------------------------------
