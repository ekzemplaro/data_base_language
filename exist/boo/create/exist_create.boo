// ----------------------------------------------------------------
/*
	exist_create.boo

					Sep/18/2011

*/
// ----------------------------------------------------------------
import	System

// ----------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t4251","長崎",15736,"1968-8-4")
	dict_aa = dict_append_proc (dict_aa,"t4252","佐世保",68392,"1968-5-27")
	dict_aa = dict_append_proc (dict_aa,"t4253","島原",78197,"1968-4-22")
	dict_aa = dict_append_proc (dict_aa,"t4254","大村",37842,"1968-1-12")
	dict_aa = dict_append_proc (dict_aa,"t4255","諫早",95719,"1968-4-25")
	dict_aa = dict_append_proc (dict_aa,"t4256","五島",21956,"1968-3-7")
	dict_aa = dict_append_proc (dict_aa,"t4257","平戸",75934,"1968-7-21")
	dict_aa = dict_append_proc (dict_aa,"t4258","雲仙",31982,"1968-5-7")
	dict_aa = dict_append_proc (dict_aa,"t4259","松浦",52527,"1968-3-11")

	return	dict_aa

// ----------------------------------------------------------------
print "*** 開始 ***"

dict_aa = data_prepare_proc ()

dict_display_proc (dict_aa)

xml_str = dict_to_xml_proc (dict_aa)

url = "http://localhost:8086/exist/rest/db/cities/cities.xml"

user=""
password=""

get_uri.put_uri_string_proc (url,xml_str,user,password)

print "*** 終了 ***"

// --------------------------------------------------------------------

