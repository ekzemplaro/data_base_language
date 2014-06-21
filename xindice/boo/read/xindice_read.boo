// ------------------------------------------------------------------
//	xindice_read.boo
//
//						May/21/2012
//
// ------------------------------------------------------------------
import System
// ------------------------------------------------------------------
print "*** 開始 ***"

url = "http://host_dbase:8888/xindice/db/cities/cities"

print url

user = ""
password = ""

str_xml = get_uri.get_uri_proc (url,user,password)

dict_aa = xml_to_dict_proc (str_xml)

dict_display_proc (dict_aa)

print "*** 終了 ***"

// ------------------------------------------------------------------
