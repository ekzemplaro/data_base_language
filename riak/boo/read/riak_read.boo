// ------------------------------------------------------------------
//	riak_read.boo
//
//					Aug/22/2013
//
// ------------------------------------------------------------------
import	System
import	System.Collections.Generic
import	Newtonsoft.Json
// ------------------------------------------------------------------
print '*** 開始 ***'

url_base = "http://localhost:8098/riak/shimane"
url_in = url_base + "?keys=true"

user = ""
password = ""

str_json = get_uri.get_uri_proc (url_in,user,password)

print str_json

//data_aa = JsonConvert.DeserializeObject <Dictionary <String,Object>> (str_json)
data_aa = JsonConvert.DeserializeObject (str_json)

print data_aa

//dict_aa = json_manipulate.json_to_dict_proc (str_json)

//text_manipulate.dict_display_proc (dict_aa)

print '*** 終了 ***'

// ------------------------------------------------------------------
