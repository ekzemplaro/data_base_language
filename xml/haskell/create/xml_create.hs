#! /usr/bin/runghc
-- -----------------------------------------------------------------
--	xml_create.hs
--
--					Dec/24/2014
-- -----------------------------------------------------------------
import System.Environment
import Data.Map

import Xml_manipulate
import Text_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let out_file = head args
	let dict_aa = data_prepare_proc
	let str_out = dict_to_xml_proc dict_aa
	writeFile out_file str_out
	putStrLn "*** 終了***"
--
-- -----------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t2261",unit_gen_proc ["静岡","29847","1960-7-14"]),
		("t2262",unit_gen_proc ["浜松" ,"41736" ,"1960-9-25"]),
		("t2263",unit_gen_proc ["沼津" ,"78351" ,"1960-3-21"]),
		("t2264",unit_gen_proc ["三島" ,"56427" ,"1960-2-18"]),
		("t2265",unit_gen_proc ["富士" ,"27194" ,"1960-1-9"]),
		("t2266",unit_gen_proc ["熱海" ,"81526" ,"1960-5-14"]),
		("t2267",unit_gen_proc ["富士宮" ,"97152" ,"1960-8-21"]),
		("t2268",unit_gen_proc ["藤枝" ,"56321" ,"1960-5-7"]),
		("t2269",unit_gen_proc ["御殿場" ,"89615" ,"1960-10-12"]),
		("t2270",unit_gen_proc ["島田" ,"13452" ,"1960-7-24"])
		]
-- -----------------------------------------------------------------
