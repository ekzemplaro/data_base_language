#! /usr/bin/runghc
-- -----------------------------------------------------------------
-- mcached_create.hs
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
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"
--
	let hostname = "localhost"

	let dict_aa = data_prepare_proc
--
	dict_to_mcached_proc hostname dict_aa
--
	System.IO.putStrLn "*** 終了***"
-- -----------------------------------------------------------------
dict_to_mcached_proc hostname dict_aa =
	do
	let list_aa = toList dict_aa
--
	withSocketsDo $ do
	hSetBuffering stdout NoBuffering 
	hh <- connectTo hostname (PortNumber 11211)
	hSetBuffering hh LineBuffering
--
	mapM (unit_insert_proc hh) list_aa
	hFlush hh
	hClose hh	
-- -----------------------------------------------------------------
unit_insert_proc hh hash_aa = 
	do
--	print key
--	print json_str
	mcached_set_proc key json_str hh
	where
		key = fst hash_aa
		unit_aa = snd hash_aa
		json_str = encode unit_aa
-- -----------------------------------------------------------------
mcached_set_proc :: [Char] -> Data.ByteString.Lazy.Char8.ByteString -> Handle -> IO ()
mcached_set_proc key_in bytestr_bb hh = do
	let llx = Data.ByteString.Lazy.Char8.length bytestr_bb
	let str_aa = "set " ++ key_in ++ " 0 0 " ++ (show llx) ++ "\r\n"
	print str_aa
--
	let str_bb = Data.ByteString.Lazy.Internal.unpackChars bytestr_bb
	let str_cc = str_bb ++ "\r\n"
	Data.ByteString.Lazy.Char8.putStrLn bytestr_bb
	print llx
	let command = str_aa ++ str_cc
	GHC.IO.Handle.Text.hPutStrLn hh command
	hFlush hh
	aa <- GHC.IO.Handle.Text.hGetLine hh
	print aa
-- -----------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t1731",unit_gen_proc ["金沢","14827","1960-8-11"]),
		("t1732",unit_gen_proc ["輪島" ,"42136" ,"1960-2-15"]),
		("t1733",unit_gen_proc ["小松" ,"63851" ,"1960-7-24"]),
		("t1734",unit_gen_proc ["七尾" ,"42167" ,"1960-1-8"]),
		("t1735",unit_gen_proc ["珠洲" ,"37954" ,"1960-5-9"]),
		("t1736",unit_gen_proc ["加賀" ,"84216" ,"1960-10-14"]),
		("t1737",unit_gen_proc ["羽咋" ,"93528" ,"1960-8-21"]),
		("t1738",unit_gen_proc ["かほく" ,"62471" ,"1960-5-7"]),
		("t1739",unit_gen_proc ["白山" ,"21537" ,"1960-11-12"])
		]
-- -----------------------------------------------------------------
