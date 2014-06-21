#! /usr/bin/lua
-- -*- coding: utf-8 -*-
--
--	master_lua_read.lua
--
--					Dec/16/2010
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

	record_out (1421,"横浜",38507,"1981-4-17",",")
	record_out (1422,"川崎",89706,"1981-3-15",",")
	record_out (1423,"小田原",59104,"1981-7-12",",")
	record_out (1424,"藤沢",79102,"1981-8-14",",")
	record_out (1425,"相模原",89103,"1981-1-16",",")
	record_out (1426,"厚木",42138,"1981-11-21","]")

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
