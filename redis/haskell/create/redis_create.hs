#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
-- redis_create.hs
--
--					Jan/16/2015
--
-- -----------------------------------------------------------------
import System.Environment
import Data.Map
import Data.Aeson
import GHC.IO.Handle.Text
import System.IO
import Network

import Data.ByteString.Lazy.Char8
import Data.ByteString.Lazy.Internal

import Text_manipulate
import Redis_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"
--
	let hostname = "host_dbase"

	let dict_aa = data_prepare_proc
--
	dict_to_redis_proc hostname dict_aa
--
	System.IO.putStrLn "*** 終了***"
-- -----------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t1851",unit_gen_proc ["福井","82791","1960-5-21"]),
		("t1852",unit_gen_proc ["敦賀" ,"13658" ,"1960-9-16"]),
		("t1853",unit_gen_proc ["小浜" ,"85172" ,"1960-7-24"]),
		("t1854",unit_gen_proc ["大野" ,"67283" ,"1960-1-8"]),
		("t1855",unit_gen_proc ["勝山" ,"37954" ,"1960-5-9"]),
		("t1856",unit_gen_proc ["鯖江" ,"84216" ,"1960-10-14"]),
		("t1857",unit_gen_proc ["あわら" ,"93528" ,"1960-8-21"]),
		("t1858",unit_gen_proc ["越前" ,"62471" ,"1960-5-7"]),
		("t1859",unit_gen_proc ["坂井" ,"21537" ,"1960-11-12"])
		]
-- -----------------------------------------------------------------
