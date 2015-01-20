#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	text_update.hs
--
--						Dec/25/2014
--
-- -----------------------------------------------------------------
import	System.Environment
import	System.IO.Strict

import Text_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let file_name = head args
	let key_in = head (tail args)
	let population_in = head (tail (tail args))
	putStr (key_in ++ "\t")
	putStr (population_in ++ "\n")
--
	inStr <- System.IO.Strict.readFile file_name
--
	let dict_aa = str_to_dict_proc inStr
--
	today <- get_current_date_proc
--
	let dict_bb = dict_update_proc key_in population_in today dict_aa
--
	let str_bb = dict_to_str_proc "\t" dict_bb
	writeFile file_name str_bb
--
	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
