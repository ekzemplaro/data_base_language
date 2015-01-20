#! /usr/bin/runghc
-- ---------------------------------------------------------------------
--	 couch_read.hs
--
--					Dec/23/2014
--
-- ---------------------------------------------------------------------
import Network.Curl

-- ---------------------------------------------------------------------
main :: IO ()
main = do
	putStrLn "*** 開始 ***\n"
	let uri = "http://localhost:5984/nagano/_all_docs"
	(_,xs)  <- curlGetString uri []
	putStr xs
	let uri = "http://localhost:5984/nagano/t2034"
	(_,xs)  <- curlGetString uri []
	putStr xs
	putStrLn "*** 終了 ***"
-- ---------------------------------------------------------------------
