#! /usr/bin/lua
-- ----------------------------------------------------
--	text_delete.lua
--
--				Jun/22/2011
--
-- ----------------------------------------------------
require	('text_manipulate')
-- ----------------------------------------------------
print ("*** 開始 ***")

local file_txt=arg[1]
local id_in= arg[2]

print (id_in)

dict_aa = text_read_proc (file_txt)

dict_bb = dict_delete_proc (dict_aa,id_in)

dict_display_proc (dict_bb)

text_write_proc (file_txt,dict_bb)

print ("*** 終了 ***")
-- ----------------------------------------------------
