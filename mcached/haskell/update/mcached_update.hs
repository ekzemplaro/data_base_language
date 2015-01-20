#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
--	mcached_update.hs
--
--						Jan/16/2015
--
-- -----------------------------------------------------------------
import System.Environment
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
	aa <- GHC.IO.Handle.Text.hGetLine hh
	print aa

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
		Nothing -> Prelude.putStrLn "Sorry mate this is not happening"	
--
	cc <- GHC.IO.Handle.Text.hGetLine hh
	System.IO.putStr ""
-- -----------------------------------------------------------------
-- [4]:
data_update_proc :: [Char] -> [Char] -> [Char] -> [Char] -> IO ()
data_update_proc hostname key_in population_in today =
	do
	let command = "get " ++ key_in ++ "\r\n"
--
	withSocketsDo $ do 
	hSetBuffering stdout NoBuffering 
	hh <- connectTo hostname (PortNumber 11211)
	hSetBuffering hh LineBuffering
	GHC.IO.Handle.Text.hPutStrLn hh command
	aa <- GHC.IO.Handle.Text.hGetLine hh
--
	if (Prelude.take 3 aa) == "END" then System.IO.putStr ""
		else update_process_two_proc key_in population_in today hh
        hClose hh
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"
--
	today <- get_current_date_proc
--
	av01<-getArgs
	let key_in=Prelude.head av01
	let population_in=Prelude.head (Prelude.tail av01)
	System.IO.putStrLn (key_in ++ " : " ++  population_in)
--
	let hostname = "localhost"
--
	data_update_proc hostname key_in population_in today
--
	System.IO.putStrLn "*** 終了***"
--
-- -----------------------------------------------------------------
