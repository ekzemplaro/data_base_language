#! /usr/bin/runghc
-- -----------------------------------------------------------------
-- tyrant_create.hs
--
--					Feb/11/2015
--
-- -----------------------------------------------------------------
import System.Environment
import Data.Map
import System.IO

import Text_manipulate
import Mcache_manipulate
-- -----------------------------------------------------------------
main :: IO ()
main = do
	System.IO.putStrLn "*** 開始 ***"
--
	let hostname = "host_ubuntu1"
	let port = 1978

	let dict_aa = data_prepare_proc
--
	dict_to_mcached_proc hostname port dict_aa
--
	System.IO.putStrLn "*** 終了***"

-- -----------------------------------------------------------------
data_prepare_proc :: Map [Char] (Map [Char] [Char])
data_prepare_proc =
	fromList
		[("t4761",unit_gen_proc ["那覇","72891","1960-5-23"]),
		("t4762",unit_gen_proc ["宜野湾" ,"41936" ,"1960-8-15"]),
		("t4763",unit_gen_proc ["石垣" ,"67251" ,"1960-9-24"]),
		("t4764",unit_gen_proc ["浦添" ,"45867" ,"1960-2-7"]),
		("t4765",unit_gen_proc ["名護" ,"31254" ,"1960-5-9"]),
		("t4766",unit_gen_proc ["糸満" ,"83716" ,"1960-10-14"]),
		("t4767",unit_gen_proc ["沖縄" ,"94528" ,"1960-8-21"]),
		("t4768",unit_gen_proc ["豊見城" ,"68471" ,"1960-5-7"]),
		("t4769",unit_gen_proc ["うるま" ,"21537" ,"1960-11-12"])
		]
-- -----------------------------------------------------------------
