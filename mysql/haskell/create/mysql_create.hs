-- ---------------------------------------------------------------------
--	 mysql_create.hs
--
--					Oct/16/2012
--
-- ---------------------------------------------------------------------
import System
import Database.HDBC
--import Database.HDBC.MySQL
import Database.HSQL.MySQL

-- ---------------------------------------------------------------------
main=do
	putStrLn "*** 開始 ***\n"
	putStrLn "The arguments are:"
	av01<-getArgs
	putStr $ unlines av01
	putStrLn "\n*** aaaa ***"
	let db_file=head av01
	print av01
--
	conn <- connectMySQL  "host=localhost dbname=city"
	run conn "drop TABLE cities"[]

	run conn "CREATE TABLE cities (ID INTEGER NOT NULL PRIMARY KEY,NAME text,POPULATION int,DATE_MOD text)"[]
	run conn "INSERT INTO cities (id,Name,Population,date_mod) values (3321,'岡山', 54000,'1991-9-21');"[]
	run conn "INSERT INTO cities (id,Name,Population,date_mod) values (3322,'倉敷', 60402,'1991-10-21');"[]
	run conn "INSERT INTO cities (id,Name,Population,date_mod) values (3323,'津山', 9700,'1991-5-15');"[]
	run conn "INSERT INTO cities (id,Name,Population,date_mod) values (3324,'玉野', 78048,'1991-6-18');"[]
	run conn "INSERT INTO cities (id,Name,Population,date_mod) values (3325,'笠岡', 29057,'1991-7-24');"[]
	run conn "INSERT INTO cities (id,Name,Population,date_mod) values (3326,'井原', 40003,'1991-8-10');"[]
	run conn "INSERT INTO cities (id,Name,Population,date_mod) values (3327,'総社', 30064,'1991-11-1');"[]
	run conn "INSERT INTO cities (id,Name,Population,date_mod) values (3328,'高梁', 20025,'1991-3-21');"[]
	run conn "INSERT INTO cities (id,Name,Population,date_mod) values (3329,'新見', 40061,'1991-5-17');"[]
	commit conn
	disconnect conn
	putStrLn "*** 終了 ***"
-- ---------------------------------------------------------------------
