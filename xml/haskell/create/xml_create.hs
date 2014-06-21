-- -----------------------------------------------------------------
--	xml_create.hs
--
--					Oct/12/2012
-- -----------------------------------------------------------------
import System.Environment

import Xml_manipulate
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
data_prepare_proc :: [([Char], [([Char], [Char])])]
data_prepare_proc =
		[("t2261",[
			("name","静岡"),
			("population","14736"),
			("date_mod","1960-7-21")]),
		("t2262",[
			("name","浜松"),
			("population","28695"),
			("date_mod","1960-8-15")]),
		("t2263",[
			("name","沼津"),
			("population","35128"),
			("date_mod","1960-5-24")]),
		("t2264",[
			("name","三島"),
			("population","42769"),
			("date_mod","1960-7-14")]),
		("t2265",[
			("name","富士"),
			("population","27351"),
			("date_mod","1960-1-9")]),
		("t2266",[
			("name","熱海"),
			("population","81426"),
			("date_mod","1960-5-14")]),
		("t2267",[
			("name","富士宮"),
			("population","97352"),
			("date_mod","1960-8-21")]),
		("t2268",[
			("name","藤枝"),
			("population","54927"),
			("date_mod","1960-5-7")]),
		("t2269",[
			("name","御殿場"),
			("population","81592"),
			("date_mod","1960-10-12")]),
		("t2270",[
			("name","島田"),
			("population","23915"),
			("date_mod","1960-5-24")])
		]
-- -----------------------------------------------------------------
