#! /usr/bin/runghc
-- -----------------------------------------------------------------
-- mcached_create.hs
--
--					Feb/06/2015
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
	let hostname = "localhost"
	let port = 11211

	let dict_aa = data_prepare_proc
--
	dict_to_mcached_proc hostname port dict_aa
--
	System.IO.putStrLn "*** 終了***"

-- -----------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t1731",unit_gen_proc ["金沢","74521","1960-8-11"]),
		("t1732",unit_gen_proc ["輪島" ,"48936" ,"1960-2-15"]),
		("t1733",unit_gen_proc ["小松" ,"63251" ,"1960-7-24"]),
		("t1734",unit_gen_proc ["七尾" ,"42867" ,"1960-1-8"]),
		("t1735",unit_gen_proc ["珠洲" ,"37254" ,"1960-5-9"]),
		("t1736",unit_gen_proc ["加賀" ,"84716" ,"1960-10-14"]),
		("t1737",unit_gen_proc ["羽咋" ,"93528" ,"1960-8-21"]),
		("t1738",unit_gen_proc ["かほく" ,"62471" ,"1960-5-7"]),
		("t1739",unit_gen_proc ["白山" ,"29537" ,"1960-11-12"])
		]
-- -----------------------------------------------------------------
