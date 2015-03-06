#! /usr/bin/runghc
-- -----------------------------------------------------------------
-- mcachedb_create.hs
--
--					Feb/11/2015
--
-- -----------------------------------------------------------------
import System.Environment
import Data.Map
import System.IO

import Text_manipulate
import Mcache_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"
--
	let hostname = "host_ubuntu1"
	let port = 21201

	let dict_aa = data_prepare_proc
--
	dict_to_mcached_proc hostname port dict_aa
--
	System.IO.putStrLn "*** 終了***"

-- -----------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t1521",unit_gen_proc ["新潟","74521","1960-8-11"]),
		("t1522",unit_gen_proc ["長岡" ,"48936" ,"1960-2-15"]),
		("t1523",unit_gen_proc ["新発田" ,"63251" ,"1960-7-24"]),
		("t1524",unit_gen_proc ["上越" ,"42867" ,"1960-1-8"]),
		("t1525",unit_gen_proc ["糸魚川" ,"37254" ,"1960-5-9"]),
		("t1526",unit_gen_proc ["加茂" ,"84716" ,"1960-10-14"]),
		("t1527",unit_gen_proc ["三条" ,"93528" ,"1960-8-21"]),
		("t1528",unit_gen_proc ["佐渡" ,"62471" ,"1960-5-7"]),
		("t1529",unit_gen_proc ["柏崎" ,"29537" ,"1960-11-12"]),
		("t1530",unit_gen_proc ["村上" ,"81432" ,"1960-2-24"]),
		("t1531",unit_gen_proc ["十日町" ,"56984" ,"1960-8-16"]),
		("t1532",unit_gen_proc ["五泉" ,"37251" ,"1960-9-8"])
		]
-- -----------------------------------------------------------------
