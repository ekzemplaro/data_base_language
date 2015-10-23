#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
--	Mcache_manipulate.hs
--
--						Feb/06/2015
--
-- -----------------------------------------------------------------
module Mcache_manipulate where

import System.IO
import Network
import Data.Aeson
import Data.Map
import Data.Maybe
import Data.ByteString
import Data.ByteString.Lazy.Internal
import Data.ByteString.Lazy.Char8
import GHC.IO.Handle.Text


import Text_manipulate
-- -----------------------------------------------------------------
unit_to_string_proc :: [Char] -> Map [Char] [Char] -> [Char]
unit_to_string_proc delim unit_aa =
	fromJust name ++ delim ++ fromJust population 
		++ delim ++ fromJust date_mod
	where
		name = Data.Map.lookup "name" unit_aa
		population = Data.Map.lookup "population" unit_aa
		date_mod = Data.Map.lookup "date_mod" unit_aa
-- -----------------------------------------------------------------
line_display_proc::[Char] -> Map [Char] [Char] -> IO()
line_display_proc key_in unit_aa = do
	let str_out = unit_to_string_proc "\t" unit_aa
	System.IO.putStrLn (key_in ++ "\t" ++ str_out)
-- -----------------------------------------------------------------
read_process_two_proc :: [Char] -> Handle -> IO ()
read_process_two_proc key_in hh =
	do
	bb <- GHC.IO.Handle.Text.hGetLine hh
	let bytestr_bb = Data.ByteString.Lazy.Internal.packChars bb
	let unit_aa = decode bytestr_bb :: Maybe (Map [Char] [Char])
	case (unit_aa:: Maybe (Map [Char] [Char])) of
		Just value -> line_display_proc key_in value
		Nothing -> Prelude.putStrLn "*** warning *** read_process_two_proc ***"	
--
	cc <- GHC.IO.Handle.Text.hGetLine hh
	System.IO.putStr ""
-- -----------------------------------------------------------------
mcache_read_proc :: [Char] -> PortNumber -> [Char] -> IO ()
mcache_read_proc hostname port key_in =
	do
	let command = "get " ++ key_in ++ "\r\n"
--
	withSocketsDo $ do 
	hSetBuffering stdout NoBuffering 
	hh <- connectTo hostname (PortNumber port)
	hSetBuffering hh LineBuffering
	GHC.IO.Handle.Text.hPutStrLn hh command
	aa <- GHC.IO.Handle.Text.hGetLine hh
--
	if (Prelude.take 3 aa) == "END" then System.IO.putStr ""
		else read_process_two_proc key_in hh
        hClose hh
-- -----------------------------------------------------------------
-- [4-4-6-8]:
get_updated_json_proc :: Map [Char] [Char] -> [Char] -> [Char]
	 -> Data.ByteString.Lazy.Char8.ByteString
get_updated_json_proc unit_aa population_in today =
	encode unit_bb
	where
		name = fromJust (Data.Map.lookup "name" unit_aa)
		unit_bb = unit_gen_proc [name,population_in,today]
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
--	hFlush hh
	aa <- GHC.IO.Handle.Text.hGetLine hh
	print aa
	hFlush hh

-- -----------------------------------------------------------------
-- [4-4-6]:
data_update_proc_exec::Map [Char] [Char] -> [Char] -> [Char] -> [Char] -> Handle -> IO()
data_update_proc_exec unit_aa key_in population_in today hh = do
	let bytestr_bb = get_updated_json_proc unit_aa population_in today
	mcached_set_proc key_in bytestr_bb hh
-- -----------------------------------------------------------------
-- [4-4]:
update_process_two_proc :: [Char] -> [Char] -> [Char] ->  Handle -> IO ()
update_process_two_proc key_in population_in today hh =
	do
	bb <- GHC.IO.Handle.Text.hGetLine hh
	System.IO.putStr (key_in ++ "\t")
	let bytestr_bb = Data.ByteString.Lazy.Internal.packChars bb
	let unit_aa = decode bytestr_bb :: Maybe (Map [Char] [Char])
	case (unit_aa:: Maybe (Map [Char] [Char])) of
		Just value -> data_update_proc_exec value key_in population_in today hh
		Nothing -> Prelude.putStrLn "*** warning *** update_process_two_proc ***"	
--
	cc <- GHC.IO.Handle.Text.hGetLine hh
	System.IO.putStr ""
-- -----------------------------------------------------------------
-- [4]:
mcache_update_proc :: [Char] -> PortNumber  -> [Char] -> [Char] -> [Char] -> IO ()
mcache_update_proc hostname port key_in population_in today =
	do
	System.IO.putStrLn "*** ppp ***"
	let command = "get " ++ key_in ++ "\r\n"
--
	withSocketsDo $ do 
	hSetBuffering stdout NoBuffering 
	hh <- connectTo hostname (PortNumber port)
	hSetBuffering hh LineBuffering
	GHC.IO.Handle.Text.hPutStrLn hh command
	aa <- GHC.IO.Handle.Text.hGetLine hh
--
	if (Prelude.take 3 aa) == "END" then System.IO.putStr ""
		else update_process_two_proc key_in population_in today hh
        hClose hh
--
	System.IO.putStrLn "*** sss ***"
-- -----------------------------------------------------------------
mcache_delete_proc:: [Char] -> PortNumber -> [Char] -> IO ()
mcache_delete_proc hostname port key_in = 
	do
	let command = "delete " ++ key_in ++ "\r\n"
	withSocketsDo $ do 
        hSetBuffering stdout NoBuffering 
        h <- connectTo hostname (PortNumber port)
        hSetBuffering h LineBuffering
        GHC.IO.Handle.Text.hPutStrLn h command
        GHC.IO.Handle.Text.hGetLine h >>= System.IO.putStrLn
        hClose h

-- -----------------------------------------------------------------
dict_to_mcached_proc::[Char] -> PortNumber
	 -> Map [Char] (Map [Char] [Char]) -> IO ()
dict_to_mcached_proc hostname port dict_aa =
	do
	let list_aa = toList dict_aa
--
	withSocketsDo $ do
	hSetBuffering stdout NoBuffering 
	hh <- connectTo hostname (PortNumber port)
	hSetBuffering hh LineBuffering
--
	mapM (mcache_unit_insert_proc hh) list_aa
	hFlush hh
	hClose hh	
-- -----------------------------------------------------------------
mcache_unit_insert_proc hh hash_aa = 
	do
--	print key
--	print json_str
	mcached_set_proc key json_str hh
	where
		key = fst hash_aa
		unit_aa = snd hash_aa
		json_str = encode unit_aa
-- -----------------------------------------------------------------
-- -----------------------------------------------------------------
