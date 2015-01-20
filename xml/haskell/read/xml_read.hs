#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	xml_read.hs
--
--					Dec/26/2014
-- -----------------------------------------------------------------
import	System.Environment

import Text_manipulate
import Xml_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let xml_file = head args
	str_xml <- readFile xml_file
--
	let dict_aa = xml_to_dict_proc str_xml
	let str_aa = dict_to_str_proc "\t" dict_aa
	putStr str_aa
--
	putStrLn "*** 終了 ***"
--
-- -----------------------------------------------------------------
