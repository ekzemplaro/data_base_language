-- ---------------------------------------------------------------------
--	 sqlite3_create.hs
--
--					Nov/19/2013
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
	putStrLn "The arguments are:"
	av01<-getArgs
	putStr $ unlines av01
	putStrLn "\n*** aaaa ***"
	let db_file=head av01
	print av01
--
	let dict_aa = data_prepare_proc
--
	conn <- connectSqlite3 db_file

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
		[("t0711",[
			("name","郡山"),
			("population","14832"),
			("date_mod","1960-7-12")]),
		("t0712",[
			("name","会津若松"),
			("population","28195"),
			("date_mod","1960-2-18")]),
		("t0713",[
			("name","白河"),
			("population","35172"),
			("date_mod","1960-2-21")]),
		("t0714",[
			("name","福島"),
			("population","58427"),
			("date_mod","1960-9-8")]),
		("t0715",[
			("name","喜多方"),
			("population","27354"),
			("date_mod","1960-1-9")]),
		("t0716",[
			("name","二本松"),
			("population","81426"),
			("date_mod","1960-5-14")]),
		("t0717",[
			("name","いわき"),
			("population","97352"),
			("date_mod","1960-8-21")]),
		("t0718",[
			("name","相馬"),
			("population","56921"),
			("date_mod","1960-5-7")]),
		("t0719",[
			("name","須賀川"),
			("population","81625"),
			("date_mod","1960-10-12")])
		]
-- ---------------------------------------------------------------------
