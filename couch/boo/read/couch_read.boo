// ------------------------------------------------------------------
//	couch_read.boo
//
//					Mar/12/2013
//
// ------------------------------------------------------------------
import System


// ------------------------------------------------------------------
print '*** 開始 ***'

url = "http://host_dbase:5984/city/cities"

user = ""
password = ""

str_json = get_uri.get_uri_proc (url,user,password)

dict_aa = json_manipulate.json_to_dict_proc (str_json)

text_manipulate.dict_display_proc (dict_aa)

print '*** 終了 ***'

// ------------------------------------------------------------------
