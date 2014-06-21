#! /usr/bin/lua
-- ----------------------------------------------------
--	json_delete.lua
--
--				May/27/2011
--
-- ----------------------------------------------------
require	('file_io')
require	('text_manipulate')

json = require	('json')
-- ----------------------------------------------------
print ("*** 開始 ***")

local file_json=arg[1]
local key_in= arg[2]
print (key_in)

json_str = file_to_str_proc (file_json)
dict_aa = json.decode(json_str)
dict_bb = dict_delete_proc (dict_aa,key_in)

str_json = json.encode (dict_bb)

io.output (file_json)
io.write (str_json)

--
print ("*** 終了 ***")
-- ----------------------------------------------------
