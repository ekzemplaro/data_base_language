-- -----------------------------------------------------------------
--	Text_manipulate.hs
--
--						Oct/10/2017
--
-- -----------------------------------------------------------------
module Text_manipulate where

-- import System.Time
import Data.Time
import Data.Char
-- import Data.List.Split
import Data.Map
import Data.Maybe

-- import qualified Data.ByteString as Str
-- -----------------------------------------------------------------
unit_gen_proc:: [[Char]] -> Map [Char] [Char]
unit_gen_proc list_in = makeMap list_keys list_in
	where
		list_keys = ["name","population","date_mod"]
		makeMap ks vs = fromList $ zip ks vs
-- -----------------------------------------------------------------
str_to_dict_proc :: (String) ->  Map [Char] (Map [Char] [Char])
str_to_dict_proc inStr =
	fromList list_aa
	where
		words_aa = Prelude.map words (lines inStr)
		list_aa = Prelude.map to_hash_proc words_aa
-- -----------------------------------------------------------------
to_hash_proc :: ([String]) -> ([Char], Map [Char] [Char])
to_hash_proc cols =
	(key,unit_gen_proc [name,population,date_mod])
	where
		key = head cols
		name = head (tail cols)
		population = head (tail (tail cols))
		date_mod = head (tail (tail (tail cols)))
-- -----------------------------------------------------------------
dict_to_str_proc :: [Char] -> Map [Char] (Map [Char] [Char]) -> [Char]
dict_to_str_proc delim dict_aa =
	unlines stringRows
		where
		list_aa = toList dict_aa
		stringRows = Prelude.map (to_string_proc delim) list_aa
-- -----------------------------------------------------------------
to_string_proc :: [Char] -> ([Char], Map [Char] [Char]) -> [Char]
to_string_proc delim xx =
	key ++ delim ++ fromJust name ++ delim ++ fromJust population ++ delim ++ fromJust date_mod
	where
		key = fst xx
		unit_aa = snd xx
		name = Data.Map.lookup "name" unit_aa
		population = Data.Map.lookup "population" unit_aa
		date_mod = Data.Map.lookup "date_mod" unit_aa
-- -----------------------------------------------------------------
dict_update_proc :: [Char] -> [Char] -> [Char] -> Map [Char] (Map [Char] [Char])
	-> Map [Char] (Map [Char] [Char])
dict_update_proc key_in population_in today dict_in =
	dict_bb
	where
		uu = Data.Map.lookup key_in dict_in
		vv = fromJust uu
--
		vv_new = Data.Map.insert "population" population_in vv
		ww_new = Data.Map.insert "date_mod" today vv_new
		dict_bb = Data.Map.insert key_in ww_new dict_in
-- -----------------------------------------------------------------
get_current_date_proc ::IO [Char]
get_current_date_proc =
	do
--		now <- getClockTime
		now <- getZonedTime
		nowCal <- toCalendarTime now
		let year = show (ctYear nowCal)
		let month = show (ctMonth nowCal)
		let day = show (ctDay nowCal)
		return (year ++ "-" ++ month ++ "-" ++ day)
	
-- -----------------------------------------------------------------
delete_proc :: [Char] -> ([Char], Map [Char] [Char]) -> Bool
delete_proc key_in hash_in = key_in /= (fst hash_in)
-- -----------------------------------------------------------------
csv_to_dict_proc :: (String) ->  Map [Char] (Map [Char] [Char])
csv_to_dict_proc inStr =
	fromList list_aa
	where
		words_aa = Prelude.map (splitOn ",") (lines inStr)
		list_aa = Prelude.map to_hash_proc words_aa
-- -----------------------------------------------------------------
