-- ----------------------------------------------------
--	xml_read.lua
--
--				May/27/2011
--
-- ----------------------------------------------------
require	('xml_manipulate')
require	('file_io')

print ("*** 開始 ***")

file_xml=arg[1]

str_xml=file_to_str_proc (file_xml)

xml_string_display (str_xml)


print ("*** 終了 ***")
-- ----------------------------------------------------
