#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
--	redis_update.hs
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
import Redis_manipulate
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
-- [4-4-6]:
data_update_proc_exec::Map [Char] [Char] -> [Char] -> [Char] -> [Char] -> Handle -> IO()
data_update_proc_exec unit_aa key_in population_in today hh = do
	let bytestr_bb = get_updated_json_proc unit_aa population_in today
	redis_set_proc key_in bytestr_bb hh
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
	System.IO.putStr ""
-- -----------------------------------------------------------------
-- [4]:
redis_update_proc :: [Char] -> [Char] -> [Char] -> [Char] -> IO ()
redis_update_proc hostname key_in population_in today =
	do
	let command = "get " ++ key_in ++ "\r\n"
--
	withSocketsDo $ do 
	hSetBuffering stdout NoBuffering 
	hh <- connectTo hostname (PortNumber 6379)
	hSetBuffering hh LineBuffering
	GHC.IO.Handle.Text.hPutStrLn hh command
	aa <- GHC.IO.Handle.Text.hGetLine hh
--
	if (Prelude.take 3 aa) == "$-1" then System.IO.putStr ""
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
	let hostname = "host_dbase"
--
	redis_update_proc hostname key_in population_in today
--
	System.IO.putStrLn "*** 終了***"
--
-- -----------------------------------------------------------------
