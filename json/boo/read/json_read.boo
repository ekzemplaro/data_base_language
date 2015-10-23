// ------------------------------------------------------------
//	json_read.boo
//
//					Jun/30/2014
//
// ------------------------------------------------------------
import	System
// ------------------------------------------------------------
print '*** 開始 ***'
file_json = argv[0]

print file_json

str_json = file_io.file_to_str_proc (file_json)

dict_aa = json_manipulate.json_to_dict_proc (str_json)

text_manipulate.dict_display_proc (dict_aa)

print '*** 終了 ***'
// ------------------------------------------------------------
