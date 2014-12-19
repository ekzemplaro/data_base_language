#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	csv_delete.hs
--
--						Dec/12/2014
--
-- -----------------------------------------------------------------
import System.Environment
import Data.Char

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
	inStr <- readFile file_name
	let dict_aa = csv_to_dict_proc inStr	
--
	let dict_bb = filter (delete_proc key_in) dict_aa
--
	let str_aa = dict_to_str_proc "," dict_bb
--	putStr str_aa
	writeFile file_name str_aa
--
	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
