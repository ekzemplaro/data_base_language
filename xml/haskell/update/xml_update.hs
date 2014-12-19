#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	xml_update.hs
--
--					Dec/12/2014
-- -----------------------------------------------------------------
import System.Environment
import Data.List
import Control.Arrow
import Control.Monad

import Text_manipulate
import Xml_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let xml_file = head args
	let key_in = head (tail args)
	let population_in = head (tail (tail args))
	putStr (key_in ++ "\t")
	putStr (population_in ++ "\n")
	str_xml <- readFile xml_file
--
	let dict_aa = to_dict_proc str_xml
	today <- get_current_date_proc
--
	let dict_bb = map (update_proc key_in population_in today) dict_aa

	let str_bb = dict_to_str_proc "\t" dict_bb
	putStr str_bb

	let str_aa = dict_to_xml_proc dict_bb
--	putStr str_aa
	writeFile xml_file str_aa
--
	putStrLn "*** 終了 ***"
--
-- -----------------------------------------------------------------
