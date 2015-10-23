// ------------------------------------------------------------
//	xml_read.boo
//
//					Jul/30/2014
//
// ------------------------------------------------------------
import System

print '*** 開始 ***'
xml_file = argv[0]

print xml_file

str_xml = file_io.file_to_str_proc (xml_file)

dict_aa = xml_manipulate.xml_to_dict_proc (str_xml)

text_manipulate.dict_display_proc (dict_aa)

print '*** 終了 ***'
// ------------------------------------------------------------
