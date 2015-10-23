// ----------------------------------------------------------------
/*
	xindice_create.boo

					May/21/2012

*/
// ----------------------------------------------------------------
import	System

// ----------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t0271","青森",28157,"1968-8-4")
	dict_aa = dict_append_proc (dict_aa,"t0272","弘前",87683,"1968-5-27")
	dict_aa = dict_append_proc (dict_aa,"t0273","八戸",78197,"1968-4-22")
	dict_aa = dict_append_proc (dict_aa,"t0274","三沢",37842,"1968-1-12")
	dict_aa = dict_append_proc (dict_aa,"t0275","黒石",95719,"1968-4-25")
	dict_aa = dict_append_proc (dict_aa,"t0276","むつ",21956,"1968-3-7")
	dict_aa = dict_append_proc (dict_aa,"t0277","五所川原",75934,"1968-7-21")
	dict_aa = dict_append_proc (dict_aa,"t0278","十和田",31982,"1968-5-7")
	dict_aa = dict_append_proc (dict_aa,"t0279","平川",52527,"1968-3-11")

	return	dict_aa

// ----------------------------------------------------------------
print "*** 開始 ***"

dict_aa = data_prepare_proc ()

dict_display_proc (dict_aa)

xml_str = dict_to_xml_proc (dict_aa)

url = "http://host_dbase:8888/xindice/db/cities/cities"

user=""
password=""

get_uri.put_uri_string_proc (url,xml_str,user,password)

print "*** 終了 ***"

// --------------------------------------------------------------------

