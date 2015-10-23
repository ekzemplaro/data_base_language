// ------------------------------------------------------------------
//	exist_read.boo
//
//						Oct/03/2011
//
// ------------------------------------------------------------------
import System
// ------------------------------------------------------------------
print "*** 開始 ***"

url = "http://localhost:8086/exist/rest/db/cities/cities.xml"

print url

user = ""
password = ""

str_xml = get_uri.get_uri_proc (url,user,password)

dict_aa = xml_to_dict_proc (str_xml)

dict_display_proc (dict_aa)

print "*** 終了 ***"

// ------------------------------------------------------------------
