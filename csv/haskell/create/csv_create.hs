#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	csv_create.hs
--
--					Dec/22/2014
--
-- -----------------------------------------------------------------
import System.Environment
import	Data.Map

import Text_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let out_file = head args
--
	let dict_aa = data_prepare_proc
--
	let delim = ","
	let str_aa = dict_to_str_proc delim dict_aa
--
	putStrLn str_aa
	writeFile out_file str_aa
--
	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t1271",unit_gen_proc ["千葉","14279","1960-5-11"]),
		("t1272",unit_gen_proc ["勝浦" ,"23586" ,"1960-9-15"]),
		("t1273",unit_gen_proc ["市原" ,"37491" ,"1960-2-24"]),
		("t1274",unit_gen_proc ["流山" ,"42367" ,"1960-7-8"]),
		("t1275",unit_gen_proc ["八千代" ,"95124" ,"1960-1-9"]),
		("t1276",unit_gen_proc ["我孫子" ,"42876" ,"1960-5-14"]),
		("t1277",unit_gen_proc ["鴨川" ,"95218" ,"1960-8-21"]),
		("t1278",unit_gen_proc ["銚子" ,"56249" ,"1960-5-7"]),
		("t1279",unit_gen_proc ["市川" ,"86195" ,"1960-10-12"])
		]
-- -----------------------------------------------------------------
