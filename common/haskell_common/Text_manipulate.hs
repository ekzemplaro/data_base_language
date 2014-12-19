-- -----------------------------------------------------------------
--	Text_manipulate.hs
--
--						Oct/10/2012
--
-- -----------------------------------------------------------------
module Text_manipulate where

import System.Time
import Data.Char
import Data.List.Split

-- import qualified Data.ByteString as Str
-- -----------------------------------------------------------------
-- str_to_dict_proc :: (Str.ByteString) ->  [([Char], [([Char], [Char])])]
str_to_dict_proc :: (String) ->  [([Char], [([Char], [Char])])]
str_to_dict_proc inStr =
	map to_hash_proc words_aa
	where
		words_aa = map words (lines inStr)
-- -----------------------------------------------------------------
to_hash_proc :: ([String]) -> ([Char], [([Char], [Char])])
-- to_hash_proc :: ([Str.ByteString]) -> ([Char], [([Char], [Char])])
to_hash_proc cols =
	(key,[("name",name),
			("population",population),
			("date_mod",date_mod)])
	where
		key = head cols
		name = head (tail cols)
		population = head (tail (tail cols))
		date_mod = head (tail (tail (tail cols)))
-- -----------------------------------------------------------------
dict_to_str_proc :: [Char] -> [([Char], [([Char], [Char])])] -> [Char]
dict_to_str_proc delim hash_aa =
	unlines stringRows
		where
		stringRows = map (to_string_proc delim) hash_aa
-- -----------------------------------------------------------------
to_string_proc :: [Char] -> ([Char], [([Char], [Char])]) -> [Char]
to_string_proc delim xx =
	key ++ delim ++ name ++ delim ++ pop ++ delim ++ date_mod
	where
		key = fst xx
		xx_unit = snd xx
		name = snd (head xx_unit)
		pop = snd (xx_unit !! 1)
		date_mod = snd (last xx_unit)
-- -----------------------------------------------------------------
update_proc :: [Char] -> [Char] -> [Char] -> ([Char], [([Char], [Char])])
	-> ([Char], [([Char], [Char])])
update_proc key_in population_in today hash_in =
	if key_in /= (fst hash_in)
	then	hash_in
	else
		(key_in,[
			("name",name),
			("population",population_in),
			("date_mod",today)])
		where
			xx_unit = snd hash_in
	                name = snd (head xx_unit)
-- -----------------------------------------------------------------
get_current_date_proc =
	do
		now <- getClockTime
		nowCal <- toCalendarTime now
		let year = show (ctYear nowCal)
		let month = show (ctMonth nowCal)
		let day = show (ctDay nowCal)
		return (year ++ "-" ++ month ++ "-" ++ day)
	
-- -----------------------------------------------------------------
delete_proc :: [Char] -> ([Char], [([Char], [Char])]) -> Bool
delete_proc key_in hash_in = key_in /= (fst hash_in)
-- -----------------------------------------------------------------
csv_to_dict_proc :: (String) ->  [([Char], [([Char], [Char])])]
csv_to_dict_proc inStr =
	map to_hash_proc words_aa
	where
		words_aa = map (splitOn ",") (lines inStr)
-- -----------------------------------------------------------------
