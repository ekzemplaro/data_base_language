#! /usr/bin/runghc
--	
--	simple_json_parser_bb.hs
--
--					Dec/25/2014
--
-- -----------------------------------------------------------------
import System.Environment
import Data.Aeson
import Data.Map
import Data.Maybe
import Data.ByteString.Lazy
import Data.ByteString.Lazy.Char8

-- -----------------------------------------------------------------
main = do
	args <- getArgs
	let file_json = Prelude.head args
	str_json <- Data.ByteString.Lazy.readFile file_json
	Data.ByteString.Lazy.Char8.putStrLn str_json

	let parsed_city = decode str_json :: Maybe (Map [Char] [Char])

	case (parsed_city:: Maybe (Map [Char] [Char])) of
		Just value -> unit_parser value
		Nothing -> Prelude.putStrLn "Sorry mate this is not happening"

-- -----------------------------------------------------------------
unit_parser unit_aa = do
	let name = fromJust (Data.Map.lookup "name" unit_aa)
	let population = fromJust (Data.Map.lookup "population" unit_aa)
	let date_mod = fromJust (Data.Map.lookup "date_mod" unit_aa)
	let str_out = name ++ "\t" ++ population ++ "\t" ++ date_mod
	let keys = Data.Map.keys unit_aa

	Prelude.putStrLn str_out
	print keys
-- -----------------------------------------------------------------
