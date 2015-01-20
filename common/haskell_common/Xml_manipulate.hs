-- -----------------------------------------------------------------
--	Xml_manipulate.hs
--
--					Dec/24/2014
-- -----------------------------------------------------------------
module Xml_manipulate where
import Text.Regex.Posix

import System.Environment
import Data.List
import Data.Map
import Data.Maybe
import Control.Arrow
import Control.Monad

import Text_manipulate
-- -----------------------------------------------------------------
dict_to_xml_proc :: Map [Char] (Map [Char] [Char]) -> [Char]
dict_to_xml_proc dict_aa =
	str_head ++ str_pp ++ str_tail
	where
		list_aa = toList dict_aa
		str_head = "<?xml version=\"1.0\"?><root>\n"
		list_bb = Data.List.map unit_to_xml_string_proc list_aa
		str_pp = unlines list_bb
		str_tail = "</root>"
	
-- -----------------------------------------------------------------
unit_to_xml_string_proc :: ([Char], (Map [Char] [Char])) -> [Char]
unit_to_xml_string_proc unit_single =
	str_id_aa ++ str_name ++ str_population ++ str_date_mod ++ str_id_bb
	where
		key = fst unit_single
		unit_aa = snd unit_single
		name =  fromJust (Data.Map.lookup "name" unit_aa)
		population = fromJust (Data.Map.lookup "population" unit_aa)
		date_mod = fromJust (Data.Map.lookup "date_mod" unit_aa)
		str_id_aa = "<" ++ key ++ ">\n"
		str_name = "<name>" ++ name ++ "</name>\n"
		str_population = "<population>" ++ population ++ "</population>\n"
		str_date_mod = "<date_mod>" ++ date_mod ++ "</date_mod>\n"
		str_id_bb = "</" ++ key ++ ">"
-- -----------------------------------------------------------------
takeWhileIncl :: (a -> Bool) -> [a] -> [a]
takeWhileIncl _ []      =  []
takeWhileIncl p (x:xs)
            | p x       =  x : takeWhileIncl p xs
            | otherwise =  [x] 
 
getsingleLineItems n = Data.List.map (takeWhile(/='<'). drop 1. dropWhile(/='>')). Data.List.filter (isInfixOf ('<': n))
 
-- -----------------------------------------------------------------
xml_to_dict_proc:: (String) -> Map [Char] (Map [Char] [Char])
xml_to_dict_proc xml_str_in =
	fromList ll_cc
	where
		xml_str = replace_proc xml_str_in "><" ">\n<"
		xmlText = lines xml_str
		ll_key =  Data.List.filter (isInfixOf "<t") xmlText
		ll_n =  getsingleLineItems "name" xmlText 
		ll_p =  getsingleLineItems "population" xmlText 
		ll_d =  getsingleLineItems "date_mod" xmlText 
--
		ll_bb = zip (zip (zip ll_key ll_n) ll_p) ll_d
--
		ll_cc = Data.List.map xml_to_dict_proc_single ll_bb
-- -----------------------------------------------------------------
xml_to_dict_proc_single tt =
	hash_aa
	where
		key_aa = tail $ fst $ fst (fst tt)
		key_bb = tail $ reverse key_aa
		key = reverse key_bb
		name = snd $ fst (fst tt)
		population = snd $ fst tt
		date_mod = snd tt
		hash_aa = (key , unit_gen_proc [name,population,date_mod])
-- -----------------------------------------------------------------
replace_proc str old new | match == "" = str
	| otherwise   = headStr ++ new ++ replace_proc tailStr old new
	where
		(headStr,match,tailStr) =  str =~ old ::(String,String,String)
-- ---------------------------------------------------------------------
-- -----------------------------------------------------------------
