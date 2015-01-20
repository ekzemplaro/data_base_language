#! /usr/bin/runghc
-- ---------------------------------------------------------------------
--	 couch_update.hs
--
--					Dec/26/2014
--
-- ---------------------------------------------------------------------
import System.Environment
import Network.Curl
import Data.Map
import Data.Maybe

import Data.Aeson
import Data.ByteString.Lazy
import Data.ByteString.Lazy.Char8
import Data.ByteString.UTF8


-- ---------------------------------------------------------------------
main :: IO ()
main = do
	Prelude.putStrLn "*** 開始 ***\n"
	args <- getArgs
	let key_in = Prelude.head args
	let population_in = Prelude.head (Prelude.tail args)
	Prelude.putStr (key_in ++ "\t")
	Prelude.putStr (population_in ++ "\n")
--
	let uri_target = "http://localhost:5984/nagano/" ++ key_in
	(_,str_json)  <- curlGetString uri_target []
	Prelude.putStr str_json
	let json_str_byte = Data.ByteString.Lazy.Char8.pack str_json
--	let json_str_byte = Data.ByteString.UTF8.fromString str_json
	print "---"
	print json_str_byte
-- ---------------------------------------------------------------------

	print "---"

	let parsed_city = Data.Aeson.decode json_str_byte :: Maybe (Map [Char] (Map [Char] [Char]))

	case (parsed_city:: Maybe (Map [Char] (Map [Char] [Char])))  of
		Just value -> unit_parser value
		Nothing -> Prelude.putStrLn "Sorry mate this is not happening"

	Prelude.putStrLn "*** 終了 ***"
-- -----------------------------------------------------------------
unit_parser unit_aa = do
	let keys = Data.Map.keys unit_aa
	print keys
-- -----------------------------------------------------------------
-- ---------------------------------------------------------------------
