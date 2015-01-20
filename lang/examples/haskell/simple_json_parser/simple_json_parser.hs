#! /usr/bin/runghc
--
--	simple_json_parser.hs
--
--					Dec/23/2014
--
-- -----------------------------------------------------------------
{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
import System.Environment
import Data.Aeson
import GHC.Generics
import Data.ByteString.Lazy

data City = City {
  name :: String,
  population :: String,
  date_mod :: String
} deriving (Show, Generic)


instance FromJSON City

-- -----------------------------------------------------------------
main = do
	args <- getArgs
	let file_json = Prelude.head args
	str_json <- Data.ByteString.Lazy.readFile file_json
	Prelude.putStrLn $ show str_json

	print "---"

	let parsed_city = decode str_json :: Maybe City
	case parsed_city of
		Just value -> unit_parser value
		Nothing -> Prelude.putStrLn "Sorry mate this is not happening"

-- -----------------------------------------------------------------
unit_parser unit_aa = do
	let name_aa = name unit_aa
	let population_aa = population unit_aa
	let date_mod_aa = date_mod unit_aa
	let str_out = name_aa ++ "\t" ++ population_aa ++ "\t" ++ date_mod_aa
	Prelude.putStrLn str_out
-- -----------------------------------------------------------------
