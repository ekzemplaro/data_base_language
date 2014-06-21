#! /usr/bin/lua
-- ----------------------------------------------------
--	json_read.lua
--
--					May/27/2011
-- ----------------------------------------------------
require	'text_manipulate'
require	'file_io'
-- ----------------------------------------------------
json = require("json")
file_in=arg[1]

print ("*** 開始 ***")
json_str = file_to_str_proc (file_in)
dict_aa = json.decode(json_str)
dict_display_proc (dict_aa)

print ("*** 終了 ***")
-- ----------------------------------------------------

