#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
--	redis_read.hs
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

import Mcache_manipulate
-- -----------------------------------------------------------------
redis_read_process_two_proc :: [Char] -> Handle -> IO ()
redis_read_process_two_proc key_in hh =
	do
	bb <- GHC.IO.Handle.Text.hGetLine hh
	let bytestr_bb = Data.ByteString.Lazy.Internal.packChars bb
	let unit_aa = decode bytestr_bb :: Maybe (Map [Char] [Char])
	case (unit_aa:: Maybe (Map [Char] [Char])) of
		Just value -> line_display_proc key_in value
		Nothing -> Prelude.putStrLn "*** warning *** redis_read_process_two_proc ***"	
--
--	cc <- GHC.IO.Handle.Text.hGetLine hh
	System.IO.putStr ""
-- -----------------------------------------------------------------
redis_read_proc :: [Char] -> [Char] -> IO ()
redis_read_proc hostname key_in =
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
		else redis_read_process_two_proc key_in hh
        hClose hh
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"
--
	let hostname = "host_dbase"
	let keys = ["t1851","t1852","t1853","t1854","t1855",
		"t1856","t1857","t1858","t1859"]
--
	mapM (redis_read_proc hostname) keys
--
	System.IO.putStrLn "*** 終了***"
--
-- -----------------------------------------------------------------
