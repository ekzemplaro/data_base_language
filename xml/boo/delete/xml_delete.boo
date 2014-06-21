// ------------------------------------------------------------
//	xml_delete.boo
//
//						Sep/27/2011
//
// ------------------------------------------------------------
import System

// ------------------------------------------------------------
print '*** 開始 ***'
xml_file = argv[0]
key = argv[1]

print xml_file
print key

str_xml = file_io.file_to_str_proc (xml_file)

dict_aa =xml_manipulate.xml_to_dict_proc (str_xml)

dict_aa.Remove (key)

text_manipulate.dict_display_proc (dict_aa)

xml_str = xml_manipulate.dict_to_xml_proc (dict_aa)

file_io.file_write_proc (xml_file,xml_str)

print '*** 終了 ***'
// ------------------------------------------------------------
