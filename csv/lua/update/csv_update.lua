#! /usr/bin/lua
-- ----------------------------------------------------
--	csv_update.lua
--
--				Jul/02/2011
--
-- ----------------------------------------------------
require	('text_manipulate')
-- ----------------------------------------------------
print ("*** 開始 ***")

local file_txt=arg[1]
local id_in= arg[2]
local population_in= 0 + arg[3]

print (id_in,population_in)

dict_aa = csv_read_proc (file_txt)

dict_bb = dict_update_proc (dict_aa,id_in,population_in)

dict_display_proc (dict_bb)

csv_write_proc (file_txt,dict_bb)

print ("*** 終了 ***")
-- ----------------------------------------------------
