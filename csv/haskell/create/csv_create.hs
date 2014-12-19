#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	csv_create.hs
--
--					Dec/12/2014
--
-- -----------------------------------------------------------------
import System.Environment
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
	writeFile out_file str_aa
--
	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
data_prepare_proc :: [([Char], [([Char], [Char])])]
data_prepare_proc =
		[("t1271",[
			("name","千葉"),
			("population","13759"),
			("date_mod","1960-8-14")]),
		("t1272",[
			("name","勝浦"),
			("population","58674"),
			("date_mod","1960-2-18")]),
		("t1273",[
			("name","市原"),
			("population","35126"),
			("date_mod","1960-7-24")]),
		("t1274",[
			("name","流山"),
			("population","54271"),
			("date_mod","1960-9-2")]),
		("t1275",[
			("name","八千代"),
			("population","35492"),
			("date_mod","1960-1-9")]),
		("t1276",[
			("name","我孫子"),
			("population","81426"),
			("date_mod","1960-5-14")]),
		("t1277",[
			("name","鴨川"),
			("population","97352"),
			("date_mod","1960-8-21")]),
		("t1278",[
			("name","銚子"),
			("population","54921"),
			("date_mod","1960-5-7")]),
		("t1279",[
			("name","市川"),
			("population","62543"),
			("date_mod","1960-10-12")])
		]
-- -----------------------------------------------------------------
