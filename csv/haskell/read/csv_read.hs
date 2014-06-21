-- -----------------------------------------------------------------
--	csv_read.hs
--
--						Nov/02/2012
--
-- -----------------------------------------------------------------
import System.Environment
import Data.List.Split

import Text_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let in_file = head args
	inStr <- readFile in_file
--
	let dict_aa = csv_to_dict_proc inStr
--
	let str_aa = dict_to_str_proc "\t" dict_aa
	putStr str_aa
--

	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
