#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	text_delete.hs
--
--						Dec/26/2014
--
-- -----------------------------------------------------------------
import	System.Environment
import	Data.Map
import	System.IO.Strict

import Text_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let file_name = head args
	let key_in = head (tail args)
	putStr (key_in ++ "\n")
--
	inStr <- System.IO.Strict.readFile file_name
	let dict_aa = str_to_dict_proc inStr
--
	let dict_bb = delete key_in dict_aa
--
	let str_aa = dict_to_str_proc "\t" dict_bb
	writeFile file_name str_aa
--
	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
