#! /usr/bin/lua
-- -*- coding: utf-8 -*-
--
--	text_lua_read.lua
--
--					May/27/2011
--
-- ---------------------------------------------------------------------
require	('text_manipulate')
-- ---------------------------------------------------------------------
json = require("json")
--
print ("Content-type: text/json\n\n")

local file_in="/var/tmp/plain_text/cities.txt"
dict_aa = text_read_proc (file_in)
json_str = json.encode (dict_aa)
print	(json_str)
--
-- ---------------------------------------------------------------------
