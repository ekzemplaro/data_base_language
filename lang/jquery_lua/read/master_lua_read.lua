#! /usr/bin/lua
-- -*- coding: utf-8 -*-
--
--	master_lua_read.lua
--
--					May/27/2011
--
-- ---------------------------------------------------------------------
require	('text_manipulate')
-- ---------------------------------------------------------------------
function data_prepare_proc ()
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t0421","仙台",28507,"1981-4-17")
	dict_aa = dict_append_proc (dict_aa,"t0422","石巻",49306,"1981-3-15")
	dict_aa = dict_append_proc (dict_aa,"t0423","塩竈",59704,"1981-7-12")
	dict_aa = dict_append_proc (dict_aa,"t0424","気仙沼",79802,"1981-8-14")
	dict_aa = dict_append_proc (dict_aa,"t0425","白石",89403,"1981-1-16")
	dict_aa = dict_append_proc (dict_aa,"t0426","名取",34208,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t0427","多賀城",69709,"1981-10-9")
	dict_aa = dict_append_proc (dict_aa,"t0428","岩沼",29601,"1981-11-17")
	dict_aa = dict_append_proc (dict_aa,"t0429","大崎",83415,"1981-6-12")

	return	dict_aa
end
-- ---------------------------------------------------------------------
	json = require("json")
--
print ("Content-type: text/json\n\n")

dict_aa = data_prepare_proc ()
str_json = json.encode (dict_aa)
print (str_json)
--
-- ---------------------------------------------------------------------
