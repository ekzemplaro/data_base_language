#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
--	mcached_read.hs
--
--						Jan/09/2015
--
-- -----------------------------------------------------------------
import System.IO
import Network
import Data.Aeson
import Data.Map
import Data.Maybe
import Data.ByteString
import Data.ByteString.Lazy.Internal
import GHC.IO.Handle.Text

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
data_parser_proc::Map [Char] [Char] -> IO()
data_parser_proc unit_aa = do
	let str_out = unit_to_string_proc "\t" unit_aa
	Prelude.putStrLn str_out
-- -----------------------------------------------------------------
process_two_proc :: [Char] -> Handle -> IO ()
process_two_proc key_in hh =
	do
	bb <- GHC.IO.Handle.Text.hGetLine hh
	System.IO.putStr (key_in ++ "\t")
	let bytestr_bb = Data.ByteString.Lazy.Internal.packChars bb
	let unit_aa = decode bytestr_bb :: Maybe (Map [Char] [Char])
	case (unit_aa:: Maybe (Map [Char] [Char])) of
		Just value -> data_parser_proc value
		Nothing -> Prelude.putStrLn "Sorry mate this is not happening"	
--
	cc <- GHC.IO.Handle.Text.hGetLine hh
	System.IO.putStr ""
-- -----------------------------------------------------------------
data_read_proc :: [Char] -> [Char] -> IO ()
data_read_proc hostname key_in =
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
		else process_two_proc key_in hh
        hClose hh
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"
--
	let hostname = "localhost"
	let keys = ["t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"]
--
	mapM (data_read_proc hostname) keys
--
	System.IO.putStrLn "*** 終了***"
--
-- -----------------------------------------------------------------
