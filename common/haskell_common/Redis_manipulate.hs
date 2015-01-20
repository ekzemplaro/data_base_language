#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
-- Redis_manipulate.hs
--
--					Jan/16/2015
--
-- -----------------------------------------------------------------
module	Redis_manipulate where

import Data.Map
import Data.Aeson
import GHC.IO.Handle.Text
import System.IO
import Network

import Data.ByteString.Lazy.Char8
import Data.ByteString.Lazy.Internal

-- -----------------------------------------------------------------
-- [4]:
dict_to_redis_proc hostname dict_aa =
	do
	let list_aa = toList dict_aa
--
	withSocketsDo $ do
	hSetBuffering stdout NoBuffering 
	hh <- connectTo hostname (PortNumber 6379)
	hSetBuffering hh LineBuffering
--
	mapM (unit_insert_proc hh) list_aa
	hFlush hh
	hClose hh	
-- -----------------------------------------------------------------
-- [4-6]:
unit_insert_proc hh hash_aa = 
	do
	redis_set_proc key json_str hh
	where
		key = fst hash_aa
		unit_aa = snd hash_aa
		json_str = encode unit_aa
-- -----------------------------------------------------------------
-- [4-6-4]:
redis_set_proc :: [Char] -> Data.ByteString.Lazy.Char8.ByteString -> Handle -> IO ()
redis_set_proc key_in bytestr_bb hh = do
	let ll_key = Prelude.length key_in
--	print ll_key
	let llx = Data.ByteString.Lazy.Char8.length bytestr_bb
	let str_aa = "*3\r\n$3\r\n" ++ "set\r\n$" ++ (show ll_key) ++ "\r\n" ++ key_in ++ "\r\n$" ++ (show llx) ++ "\r\n"
--
--
	let str_bb = Data.ByteString.Lazy.Internal.unpackChars bytestr_bb
	let str_cc = str_bb ++ "\r\n"
--	Data.ByteString.Lazy.Char8.putStrLn bytestr_bb
--	print llx
	let command = str_aa ++ str_cc
	GHC.IO.Handle.Text.hPutStrLn hh command
	aa <- GHC.IO.Handle.Text.hGetLine hh
	print aa
-- -----------------------------------------------------------------
