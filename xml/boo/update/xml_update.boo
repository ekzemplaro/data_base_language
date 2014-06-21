// ------------------------------------------------------------
//	xml_update.boo
//
//						Sep/27/2011
//
// ------------------------------------------------------------
import System

// ------------------------------------------------------------
print '*** 開始 ***'
xml_file = argv[0]
id_in = argv[1]
population_in = int.Parse (argv[2])

print xml_file
print id_in,population_in

str_xml = file_io.file_to_str_proc (xml_file)

dict_aa =xml_manipulate.xml_to_dict_proc (str_xml)

text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

text_manipulate.dict_display_proc (dict_aa)

xml_str = xml_manipulate.dict_to_xml_proc (dict_aa)

file_io.file_write_proc (xml_file,xml_str)

print '*** 終了 ***'
// ------------------------------------------------------------
