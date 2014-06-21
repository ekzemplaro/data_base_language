#! /usr/bin/lua
-- -*- coding: utf-8 -*-
--
--	notyet_lua_read.lua
--
--					Jan/26/2011
--
-- ---------------------------------------------------------------------
function record_out (id_in,name_in,population_in,date_mod_in,tail)
	json = require("json")
	obj = { id=id_in, name=name_in, 
		population=population_in, date_mod=date_mod_in}
	str_json = json.encode (obj)
	print (str_json)
	print (tail)
end
-- ---------------------------------------------------------------------
function json_str_gen_proc ()
	print ("{")
	print ("\"cities\": [")	

	record_out (1421,"横浜",28507,"1981-4-17",",")
	record_out (1422,"川崎",49306,"1981-3-15",",")
	record_out (1423,"小田原",59704,"1981-7-12",",")
	record_out (1424,"藤沢",79802,"1981-8-14",",")
	record_out (1425,"相模原",89403,"1981-1-16",",")
	record_out (1426,"厚木",39208,"1981-9-21",",")
	record_out (1427,"横須賀",69709,"1981-10-9",",")
	record_out (1428,"鎌倉",29601,"1981-11-17",",")
	record_out (1429,"逗子",83415,"1981-6-12","]")

	print ("}")
	return	str_aa
end
-- ---------------------------------------------------------------------
--
print ("Content-type: text/json\n\n")

json_str = json_str_gen_proc ()
-- print	(json_str)
--
-- ---------------------------------------------------------------------
