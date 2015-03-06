#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
--	mcachedb_read.hs
--
--						Feb/11/2015
--
-- -----------------------------------------------------------------
import System.IO

import Mcache_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"

	let hostname = "host_ubuntu1"
	let port = 21201
	let keys = ["t1521","t1522","t1523","t1524","t1525",
		"t1526","t1527","t1528","t1529",
		"t1530","t1531","t1532"]

	mapM (mcache_read_proc hostname port) keys

	System.IO.putStrLn "*** 終了***"

-- -----------------------------------------------------------------
