#! /usr/bin/runghc
-- {-# LANGUAGE OverloadedStrings #-}
-- -----------------------------------------------------------------
--	tyrant_read.hs
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
	let port = 1978
	let keys = ["t4761","t4762","t4763","t4764","t4765",
		"t4766","t4767","t4768","t4769"]

	mapM (mcache_read_proc hostname port) keys

	System.IO.putStrLn "*** 終了***"

-- -----------------------------------------------------------------
