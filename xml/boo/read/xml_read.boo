// ------------------------------------------------------------
//	xml_read.boo
//
//						Oct/03/2011
//
// ------------------------------------------------------------
import System

print '*** 開始 ***'
xml_file = argv[0]

print xml_file

print '*** ppp ***'
str_xml = file_to_str_proc (xml_file)
print '*** qqq ***'

dict_aa = xml_to_dict_proc (str_xml)
print '*** rrr ***'

dict_display_proc (dict_aa)

print '*** 終了 ***'
// ------------------------------------------------------------
