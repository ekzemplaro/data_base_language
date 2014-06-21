// ------------------------------------------------------------------
//	ftp_delete.boo
//
//					Mar/12/2013
//
// ------------------------------------------------------------------
import	System

import	Newtonsoft.Json
// ------------------------------------------------------------------
print "*** 開始 ***"
key_in = argv[0]
print key_in

url_ftp = "ftp://host_dbase/city/iwate.json"
user = "scott"
passwd = "tiger"

str_json = ftp_manipulate.ftp_to_str_proc (url_ftp,user,passwd)

dict_aa = json_manipulate.json_to_dict_proc (str_json)

if dict_aa.ContainsKey (key_in):
	dict_aa.Remove (key_in)
	text_manipulate.dict_display_proc (dict_aa)
	str_json_out = JsonConvert.SerializeObject (dict_aa)
	ftp_manipulate.str_to_ftp_proc (url_ftp,user,passwd,str_json_out)

print  "*** 終了 ***"

// ------------------------------------------------------------------
