-- ----------------------------------------------------
--	xml_delete.lua
--
--				May/27/2011
--
-- ----------------------------------------------------
require	('file_io')
require	('text_manipulate')
require	('xml_manipulate')

print ("*** 開始 ***")

local file_xml=arg[1]
local id_in= arg[2]
print (id_in)

str_xml=file_to_str_proc (file_xml)
dict_aa=xml_to_dict_proc (str_xml)

dict_bb = dict_delete_proc (dict_aa,id_in)

dict_display_proc (dict_bb)
--
str_xml_new = dict_to_xml_proc (dict_bb)
io.output (file_xml)
io.write (str_xml_new)
local xfile = xml.load(file_xml)

--
print ("*** 終了 ***")
-- ----------------------------------------------------
