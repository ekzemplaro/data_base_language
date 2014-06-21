// ------------------------------------------------------------
//	json_update.boo
//
//					Sep/27/2011
//
// ------------------------------------------------------------
import System

import Newtonsoft.Json
// ------------------------------------------------------------
print '*** 開始 ***'
file_json = argv[0]
id_in = argv[1]
population_in = int.Parse (argv[2])

print file_json
print id_in,population_in


str_json = file_io.file_to_str_proc (file_json)

dict_aa = json_manipulate.json_to_dict_proc (str_json)

text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

text_manipulate.dict_display_proc (dict_aa)

str_json_out = JsonConvert.SerializeObject (dict_aa)

file_io.file_write_proc (file_json,str_json_out)

print '*** 終了 ***'
// ------------------------------------------------------------
