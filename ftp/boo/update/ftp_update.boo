// ------------------------------------------------------------------
//	ftp_update.boo
//
//					Mar/12/2013
//
// ------------------------------------------------------------------
import	System

import	Newtonsoft.Json
// ------------------------------------------------------------------
print "*** 開始 ***"
id_in = argv[0]
population_in = int.Parse (argv[1])
print id_in,population_in

url_ftp = "ftp://host_dbase/city/iwate.json"
user = "scott"
passwd = "tiger"

str_json = ftp_manipulate.ftp_to_str_proc (url_ftp,user,passwd)

dict_aa = json_manipulate.json_to_dict_proc (str_json)

dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

text_manipulate.dict_display_proc (dict_aa)

str_json_out = JsonConvert.SerializeObject (dict_aa)

ftp_manipulate.str_to_ftp_proc (url_ftp,user,passwd,str_json_out)

print  "*** 終了 ***"

// ------------------------------------------------------------------
