#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
--	mcached_read.hs
--
--						Feb/06/2015
--
-- -----------------------------------------------------------------
import System.IO

import Mcache_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"

	let hostname = "localhost"
	let port = 11211
	let keys = ["t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"]

	mapM (mcache_read_proc hostname port) keys

	System.IO.putStrLn "*** 終了***"

-- -----------------------------------------------------------------
