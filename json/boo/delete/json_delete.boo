// ------------------------------------------------------------
//	json_delete.boo
//
//					Jan/18/2012
//
// ------------------------------------------------------------
import System

import Newtonsoft.Json
// ------------------------------------------------------------
print '*** 開始 ***'
file_json = argv[0]
key_in = argv[1]

print file_json
print key_in

str_json = file_io.file_to_str_proc (file_json)

dict_aa = json_manipulate.json_to_dict_proc (str_json)

if dict_aa.ContainsKey (key_in):
	dict_aa.Remove (key_in)
	text_manipulate.dict_display_proc (dict_aa)
	str_json_out = JsonConvert.SerializeObject (dict_aa)
	file_io.file_write_proc (file_json,str_json_out)

print '*** 終了 ***'
// ------------------------------------------------------------
