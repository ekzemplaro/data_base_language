// ------------------------------------------------------------------
//	basex_read.boo
//
//					Feb/02/2011
//
// ------------------------------------------------------------------
import System
// ------------------------------------------------------------------

print "*** 開始 ***"

url = "http://localhost:8984/rest/cities?query=/"

print  url

user = "admin"
password = "admin"

str_xml = get_uri.get_uri_proc (url,user,password)

dict_aa = xml_manipulate.xml_to_dict_proc (str_xml)

text_manipulate.dict_display_proc (dict_aa)

print "*** 終了 ***"


// ------------------------------------------------------------------
