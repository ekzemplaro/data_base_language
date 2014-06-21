-- ---------------------------------------------------------------------
--	 Sql_manipulate.hs
--
--					Oct/15/2012
--
-- ---------------------------------------------------------------------
module Sql_manipulate where

import System.Environment
import Database.HDBC
import Database.HDBC.PostgreSQL

-- ---------------------------------------------------------------------
drop_proc conn =
	run conn "drop TABLE cities"[]
-- ---------------------------------------------------------------------
create_proc conn =
	run conn "CREATE TABLE cities (ID varchar(10) NOT NULL PRIMARY KEY,NAME text,POPULATION int,DATE_MOD text)"[]

-- ---------------------------------------------------------------------
insert_proc conn hash_aa =
	run conn command_bb[]
	where
		command_head = "INSERT INTO cities (id,Name,Population,date_mod) values ("
		key_aa = fst hash_aa
		xx_unit = snd hash_aa
		name = snd (head xx_unit)
		pop = snd (xx_unit !! 1)
		date_mod = snd (last xx_unit)
		command_aa = "'" ++ key_aa ++ "','" ++ name ++ "'," ++ pop ++ ",'" ++ date_mod ++ "');"
		command_bb = command_head ++ command_aa
-- ---------------------------------------------------------------------
sql_read_proc conn =
	do
	rr <- quickQuery' conn "select id,name,population,date_mod from cities"[]
	let stringRows = map convRow_proc rr
	mapM_ putStrLn stringRows
-- ---------------------------------------------------------------------
convRow_proc ::[SqlValue] -> String
convRow_proc  [sqlId,sqlName,sqlPopulation,sqlDate_mod] =
		show id ++ "\t" ++ name ++ "\t" ++ population ++ "\t" ++ date_mod
		where	id = (fromSql sqlId)::String
			name = (fromSql sqlName)::String
			population = (fromSql sqlPopulation)::String
			date_mod = (fromSql sqlDate_mod)::String

-- ---------------------------------------------------------------------
sql_delete_proc conn key_in =
	do
	let command= "delete from cities "
		 ++ "where id='" ++ key_in ++ "'"
	r <- quickQuery' conn command[]
	commit conn
-- ---------------------------------------------------------------------
sql_update_proc conn key_in population_in today =
	do
	r <- quickQuery' conn command[]
	commit conn
	where
		command= "update cities set POPULATION=" ++ population_in
			++ ",date_mod='" ++ today ++ "' "
			++ "where id='" ++ key_in ++ "'"
-- ---------------------------------------------------------------------
