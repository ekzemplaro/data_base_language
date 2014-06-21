#! /usr/bin/lua
-- ----------------------------------------------------
--	json_update.lua
--
--				Apr/02/2013
--
-- ----------------------------------------------------
require	('text_manipulate')
require	('file_io')
json = require	('json')

-- ----------------------------------------------------
print ("*** 開始 ***")

file_json=arg[1]
id_in= arg[2]
population_in= 0 + arg[3]
print (id_in,population_in)

json_str = file_to_str_proc (file_json)
dict_aa = json.decode(json_str)
dict_bb = dict_update_proc (dict_aa,id_in,population_in)

str_json = json.encode (dict_bb)

io.output (file_json)
io.write (str_json)

--
print ("*** 終了 ***")
-- ----------------------------------------------------
