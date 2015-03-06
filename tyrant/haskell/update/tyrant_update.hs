#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
--	tyrant_update.hs
--
--						Feb/11/2015
--
-- -----------------------------------------------------------------
import System.Environment
import System.IO

import Text_manipulate
import Mcache_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"
--
	today <- get_current_date_proc
	System.IO.putStrLn today
--
	av01<-getArgs
	let key_in=Prelude.head av01
	let population_in=Prelude.head (Prelude.tail av01)
	System.IO.putStrLn (key_in ++ " : " ++  population_in)
--
	let hostname = "host_ubuntu1"
	let port = 1978

	mcache_update_proc hostname port key_in population_in today
--
	System.IO.putStrLn "*** 終了***"
--
-- -----------------------------------------------------------------
