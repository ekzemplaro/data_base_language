#! /usr/bin/runghc
-- -----------------------------------------------------------------
-- json_create.hs
--
--					Dec/26/2014
--
-- -----------------------------------------------------------------
import System.Environment
import Data.Map
import Data.Maybe
import Data.Aeson
import Data.ByteString.Lazy.Char8

import Text_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	Prelude.putStrLn "*** 開始 ***"
	args <- getArgs
	let out_file = Prelude.head args
--
	let dict_aa = data_prepare_proc
--
	let str_aa =  encode dict_aa

	Data.ByteString.Lazy.Char8.putStrLn str_aa
--
	Data.ByteString.Lazy.Char8.writeFile out_file str_aa

	Prelude.putStrLn "*** 終了***"
-- -----------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t0921",unit_gen_proc ["宇都宮","25147","1960-3-11"]),
		("t0922",unit_gen_proc ["小山" ,"49236" ,"1960-8-15"]),
		("t0923",unit_gen_proc ["佐野" ,"76851" ,"1960-5-24"]),
		("t0924",unit_gen_proc ["足利" ,"58127" ,"1960-9-8"]),
		("t0925",unit_gen_proc ["日光" ,"21354" ,"1960-1-9"]),
		("t0926",unit_gen_proc ["下野" ,"83426" ,"1960-5-14"]),
		("t0927",unit_gen_proc ["さくら" ,"97352" ,"1960-8-21"]),
		("t0928",unit_gen_proc ["矢板" ,"56921" ,"1960-5-7"]),
		("t0929",unit_gen_proc ["真岡" ,"89615" ,"1960-10-12"]),
		("t0930",unit_gen_proc ["栃木" ,"72158" ,"1960-5-9"]),
		("t0931",unit_gen_proc ["大田原" ,"41925" ,"1960-7-3"]),
		("t0932",unit_gen_proc ["鹿沼" ,"39287" ,"1960-9-12"]),
		("t0933",unit_gen_proc ["那須塩原" ,"29146" ,"1960-11-21"]),
		("t0934",unit_gen_proc ["那須烏山" ,"75823" ,"1960-12-4"])
		]
-- -----------------------------------------------------------------
