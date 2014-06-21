-- -----------------------------------------------------------------
--	text_delete.hs
--
--						Oct/10/2012
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
	let dict_aa = str_to_dict_proc inStr	
--
	let dict_bb = filter (delete_proc key_in) dict_aa
--
	let str_aa = dict_to_str_proc "\t" dict_bb
	putStr str_aa
	writeFile file_name str_aa
--
	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
