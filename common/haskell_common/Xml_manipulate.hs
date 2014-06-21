-- -----------------------------------------------------------------
--	Xml_manipulate.hs
--
--					Oct/16/2012
-- -----------------------------------------------------------------
module Xml_manipulate where
import Text.Regex.Posix

import System.Environment
import Data.List
import Control.Arrow
import Control.Monad

-- -----------------------------------------------------------------
dict_to_xml_proc :: [([Char], [([Char], [Char])])] -> [Char]
dict_to_xml_proc dict_aa =
	str_head ++ str_pp ++ str_tail
	where
		str_head = "<?xml version=\"1.0\"?><root>\n"
		list_aa = map hash_to_string_proc dict_aa
		str_pp = unlines list_aa
		str_tail = "</root>"
	
-- -----------------------------------------------------------------
hash_to_string_proc :: ([Char], [([Char], [Char])]) -> [Char]
hash_to_string_proc unit_aa =
	str_id_aa ++ str_name ++ str_population ++ str_date_mod ++ str_id_bb
	where
		key = fst unit_aa
		xx_unit = snd unit_aa
		name = snd (head xx_unit)
		population = snd (xx_unit !! 1)
		date_mod = snd (last xx_unit)
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
 
getsingleLineItems n = map (takeWhile(/='<'). drop 1. dropWhile(/='>')). filter (isInfixOf ('<': n))
 
-- -----------------------------------------------------------------
to_dict_proc xml_str_in =
	ll_cc
	where
		xml_str = replace_proc xml_str_in "><" ">\n<"
		xmlText = lines xml_str
		ll_key =  filter (isInfixOf "<t") xmlText
		ll_n =  getsingleLineItems "name" xmlText 
		ll_p =  getsingleLineItems "population" xmlText 
		ll_d =  getsingleLineItems "date_mod" xmlText 
--
		ll_bb = zip (zip (zip ll_key ll_n) ll_p) ll_d
--
		ll_cc = map to_dict_proc_single ll_bb
-- -----------------------------------------------------------------
to_dict_proc_single tt =
	hash_aa
	where
		key_aa = tail $ fst $ fst (fst tt)
		key_bb = tail $ reverse key_aa
		key = reverse key_bb
		name = snd $ fst (fst tt)
		population = snd $ fst tt
		date_mod = snd tt
		hash_aa = (key , [
			("name",name),
			("population",population),
			("date_mod", date_mod)])
-- -----------------------------------------------------------------
replace_proc str old new | match == "" = str
	| otherwise   = headStr ++ new ++ replace_proc tailStr old new
	where
		(headStr,match,tailStr) =  str =~ old ::(String,String,String)
-- ---------------------------------------------------------------------
-- -----------------------------------------------------------------
