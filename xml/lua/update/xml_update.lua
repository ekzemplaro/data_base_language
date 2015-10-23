-- ----------------------------------------------------
--	xml_update.lua
--
--				May/27/2011
--
-- ----------------------------------------------------
require	('LuaXml')
require	('xml_manipulate')
require	('text_manipulate')
require	('file_io')

print ("*** 開始 ***")

local file_xml=arg[1]
local id_in= arg[2]
local population_in= 0 + arg[3]
print (id_in,population_in)

str_xml=file_to_str_proc (file_xml)
dict_aa=xml_to_dict_proc (str_xml)

dict_bb = dict_update_proc (dict_aa,id_in,population_in)

dict_display_proc (dict_bb)
--
str_xml_new = dict_to_xml_proc (dict_bb)
io.output (file_xml)
io.write (str_xml_new)
--
--
print ("*** 終了 ***")
-- ----------------------------------------------------
