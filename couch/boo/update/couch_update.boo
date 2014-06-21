// ------------------------------------------------------------------
//	couch_update.boo
//
//					Mar/12/2013
//
// ------------------------------------------------------------------
import	System
import	Newtonsoft.Json
// ------------------------------------------------------------------
print '*** 開始 ***'

id_in = argv[0]
population_in = int.Parse (argv[1])

print id_in,population_in

url = "http://host_dbase:5984/city/cities"

user = ""
password = ""

str_json = get_uri.get_uri_proc (url,user,password)

dict_aa = json_manipulate.json_to_dict_proc (str_json)

text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

text_manipulate.dict_display_proc (dict_aa)

str_json_out = JsonConvert.SerializeObject (dict_aa)

// print str_json_out

get_uri.put_uri_string_proc (url,str_json_out,user,password)

print '*** 終了 ***'

// ------------------------------------------------------------------
