// ------------------------------------------------------------
//	json_read.boo
//
//					Jan/30/2014
//
// ------------------------------------------------------------
import	System
import System.Collections
// import	System.Collections.Generic
// import	System.Collections.HashTable
// ------------------------------------------------------------
print '*** 開始 ***'
file_json = argv[0]

print file_json

str_json = file_to_str_proc (file_json)

dict_aa = json_to_dict_proc (str_json)

dict_display_proc (dict_aa)

print '*** 終了 ***'
// ------------------------------------------------------------
