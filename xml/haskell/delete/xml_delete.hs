#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	xml_delete.hs
--
--					Dec/24/2014
-- -----------------------------------------------------------------
import	System.Environment
import	Data.Map
import	System.IO.Strict

import Text_manipulate
import Xml_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let xml_file = head args
	let key_in = head (tail args)
	putStrLn key_in
	str_xml <- System.IO.Strict.readFile xml_file
--
	let dict_aa = xml_to_dict_proc str_xml
--
	let dict_bb = delete key_in dict_aa

	let str_xml_new = dict_to_xml_proc dict_bb
	writeFile xml_file str_xml_new
--
	putStrLn "*** 終了 ***"
--
-- -----------------------------------------------------------------
