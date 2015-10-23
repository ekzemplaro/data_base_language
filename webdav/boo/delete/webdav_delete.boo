// ------------------------------------------------------------------
//	webdav_delete.boo
//
//					Jan/25/2012
//
// ------------------------------------------------------------------
import System

import Newtonsoft.Json
// ------------------------------------------------------------------
print '*** 開始 ***'
key_in = argv[0]

print key_in

url = "http://host_dbase:3004/city/tokyo.json"

user = ""
password = ""

str_json = get_uri.get_uri_proc (url,user,password)

dict_aa = json_manipulate.json_to_dict_proc (str_json)

if dict_aa.ContainsKey (key_in):
	dict_aa.Remove (key_in)
	str_json_out = JsonConvert.SerializeObject (dict_aa)
	get_uri.put_uri_string_proc (url,str_json_out,user,password)

print '*** 終了 ***'

// ------------------------------------------------------------------
