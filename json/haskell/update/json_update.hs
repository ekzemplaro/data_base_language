#! /usr/bin/runghc
--	
--	json_update.hs
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

import Text_manipulate
-- -----------------------------------------------------------------
main = do
	Prelude.putStrLn "*** 開始 ***"
	args <- getArgs
	let file_json = Prelude.head args
	let key_in = Prelude.head (Prelude.tail args)
	let population_in = Prelude.head (Prelude.tail (Prelude.tail args))
	Prelude.putStrLn (file_json)
	Prelude.putStr (key_in ++ "\t")
	Prelude.putStr (population_in ++ "\n")
--
	str_json <- Data.ByteString.Lazy.readFile file_json

	let parsed_city = decode str_json :: Maybe (Map [Char] (Map [Char] [Char]))

	case (parsed_city:: Maybe (Map [Char] (Map [Char] [Char]))) of
		Just value -> data_parser_proc value file_json key_in population_in
		Nothing -> Prelude.putStrLn "Sorry mate this is not happening"
--
	Prelude.putStrLn "*** 終了***"

-- -----------------------------------------------------------------
data_parser_proc :: Map [Char] (Map [Char] [Char])
     -> FilePath -> [Char] -> [Char] -> IO ()
data_parser_proc dict_aa file_json key_in population_in = do
	today <- get_current_date_proc
--
	let dict_bb = dict_update_proc key_in population_in today dict_aa
--
	let str_bb = encode dict_bb
--	Data.ByteString.Lazy.Char8.putStr str_bb
	Data.ByteString.Lazy.Char8.writeFile file_json str_bb
-- -----------------------------------------------------------------
