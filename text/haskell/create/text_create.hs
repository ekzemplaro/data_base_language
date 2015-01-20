#! /usr/bin/runghc
-- -----------------------------------------------------------------
-- text_create.hs
--
--					Dec/26/2014
--
-- -----------------------------------------------------------------
import System.Environment
import Data.Map

import Text_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***"
	args <- getArgs
	let out_file = head args
--
	let dict_aa = data_prepare_proc
--
	let delim = "\t"
	let str_aa = dict_to_str_proc delim dict_aa
	putStr str_aa
--
	writeFile out_file str_aa

	putStrLn "*** 終了***"
-- -----------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t2381",unit_gen_proc ["名古屋","28147","1960-3-11"]),
		("t2382",unit_gen_proc ["豊橋" ,"49236" ,"1960-8-15"]),
		("t2383",unit_gen_proc ["岡崎" ,"76351" ,"1960-5-24"]),
		("t2384",unit_gen_proc ["一宮" ,"58427" ,"1960-9-8"]),
		("t2385",unit_gen_proc ["蒲郡" ,"21354" ,"1960-1-9"]),
		("t2386",unit_gen_proc ["常滑" ,"83426" ,"1960-5-14"]),
		("t2387",unit_gen_proc ["大府" ,"97352" ,"1960-8-21"]),
		("t2388",unit_gen_proc ["瀬戸" ,"56921" ,"1960-5-7"]),
		("t2389",unit_gen_proc ["犬山" ,"89615" ,"1960-10-12"])
		]
-- -----------------------------------------------------------------
