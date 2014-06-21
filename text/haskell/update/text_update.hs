-- -----------------------------------------------------------------
--	text_update.hs
--
--						Oct/09/2012
--
-- -----------------------------------------------------------------
import System.Environment

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
--
	inStr <- readFile file_name
--
	let hash_aa = str_to_dict_proc inStr
--
	today <- get_current_date_proc
--
	let hash_bb = map (update_proc key_in population_in today) hash_aa
--
	let str_aa = dict_to_str_proc "\t" hash_bb
	putStr str_aa
	writeFile file_name str_aa
--
	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
