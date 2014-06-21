// ------------------------------------------------------------------
//	exist_delete.boo
//
//					Oct/03/2011
//
// ------------------------------------------------------------------
import System

// ------------------------------------------------------------------
print '*** 開始 ***'
key = argv[0]

print key

url = "http://localhost:8086/exist/rest/db/cities/cities.xml"

user=""
password=""

str_xml = get_uri.get_uri_proc (url,user,password)

dict_aa = xml_to_dict_proc (str_xml)

dict_aa.Remove (key)

dict_display_proc (dict_aa)

xml_str = dict_to_xml_proc (dict_aa)

get_uri.put_uri_string_proc (url,xml_str,user,password)

print '*** 終了 ***'

// ------------------------------------------------------------------
