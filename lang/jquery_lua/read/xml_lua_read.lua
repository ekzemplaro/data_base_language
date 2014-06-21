#! /usr/bin/lua
-- -*- coding: utf-8 -*-
--
--	xml_lua_read.lua
--
--					May/27/2011
--
-- ---------------------------------------------------------------------
require	('file_io')
require	('xml_manipulate')
require	('text_manipulate')

-- ---------------------------------------------------------------------
json = require("json")
--
print ("Content-type: text/json\n\n")

file_xml="/var/tmp/xml_file/cities.xml"

str_xml=file_to_str_proc (file_xml)
dict_aa=xml_to_dict_proc (str_xml)
json_str = json.encode (dict_aa)
print	(json_str)

--json_str = json_str_gen_proc ()
-- print	(json_str)
--
-- ---------------------------------------------------------------------
