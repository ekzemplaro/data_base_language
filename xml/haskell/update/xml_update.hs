#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	xml_update.hs
--
--					Dec/26/2014
-- -----------------------------------------------------------------
import	System.Environment
import	System.IO.Strict

import Text_manipulate
import Xml_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	Prelude.putStrLn "*** 開始 ***"
	args <- getArgs
	let xml_file = Prelude.head args
	let key_in = Prelude.head (Prelude.tail args)
	let population_in = Prelude.head (Prelude.tail (Prelude.tail args))
	Prelude.putStr (key_in ++ "\t")
	Prelude.putStr (population_in ++ "\n")
	str_xml <- System.IO.Strict.readFile xml_file
--
	let dict_aa = xml_to_dict_proc str_xml
	today <- get_current_date_proc
	let dict_bb = dict_update_proc key_in population_in today dict_aa
	
	let str_xml_new = dict_to_xml_proc dict_bb
	writeFile xml_file str_xml_new
--
	Prelude.putStrLn "*** 終了 ***"
--
-- -----------------------------------------------------------------
