#! /usr/bin/runghc
--	
--	json_read.hs
--
--					Dec/26/2014
--
-- -----------------------------------------------------------------
import System.Environment
import Data.Aeson
import Data.Map
import Data.Maybe
import Data.ByteString.Lazy
import Data.ByteString.Lazy.Char8

import Text_manipulate
-- -----------------------------------------------------------------
main = do
	Prelude.putStrLn "*** 開始 ***"
	args <- getArgs
	let file_json = Prelude.head args
	str_json <- Data.ByteString.Lazy.Char8.readFile file_json
--	Data.ByteString.Lazy.Char8.putStrLn str_json

	let parsed_city = decode str_json :: Maybe (Map [Char] (Map [Char] [Char]))

	case (parsed_city:: Maybe (Map [Char] (Map [Char] [Char]))) of
		Just value -> data_parser_proc value
		Nothing -> Prelude.putStrLn "Sorry mate this is not happening"
--
	Prelude.putStrLn "*** 終了***"

-- -----------------------------------------------------------------
data_parser_proc ::Map [Char] (Map [Char] [Char]) -> IO()
data_parser_proc dict_aa = do
	let keys = Data.Map.keys dict_aa
	print keys
--
	let str_aa = dict_to_str_proc "\t" dict_aa
	Prelude.putStr str_aa
-- -----------------------------------------------------------------
