-- -----------------------------------------------------------------
-- text_create.hs
--
--					Oct/16/2012
--
-- -----------------------------------------------------------------
import System.Environment

import Text_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let out_file = head args
--
	let hash_aa = data_prepare_proc
--
	let delim = "\t"
	let str_aa = dict_to_str_proc delim hash_aa
	putStr str_aa
--
	writeFile out_file str_aa
	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
data_prepare_proc :: [([Char], [([Char], [Char])])]
data_prepare_proc =
		[("t2381",[
			("name","名古屋"),
			("population","95147"),
			("date_mod","1960-3-11")]),
		("t2382",[
			("name","豊橋"),
			("population","47286"),
			("date_mod","1960-8-15")]),
		("t2383",[
			("name","岡崎"),
			("population","79351"),
			("date_mod","1960-5-24")]),
		("t2384",[
			("name","一宮"),
			("population","58427"),
			("date_mod","1960-9-8")]),
		("t2385",[
			("name","蒲郡"),
			("population","27354"),
			("date_mod","1960-1-9")]),
		("t2386",[
			("name","常滑"),
			("population","81426"),
			("date_mod","1960-5-14")]),
		("t2387",[
			("name","大府"),
			("population","97352"),
			("date_mod","1960-8-21")]),
		("t2388",[
			("name","瀬戸"),
			("population","54921"),
			("date_mod","1960-5-7")]),
		("t2389",[
			("name","犬山"),
			("population","84625"),
			("date_mod","1960-10-12")])
		]
-- -----------------------------------------------------------------
