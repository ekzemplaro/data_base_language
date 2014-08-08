// ------------------------------------------------------------------
//	couch_create.boo
//
//					Jul/30/2014
//
// ------------------------------------------------------------------
import System

import Newtonsoft.Json
// ------------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,"t2021","長野",'34512',"1968-6-7")
	dict_aa = dict_append_proc (dict_aa,"t2022","松本",'17954',"1968-5-19")
	dict_aa = dict_append_proc (dict_aa,"t2023","上田",'76928',"1968-3-28")
	dict_aa = dict_append_proc (dict_aa,"t2024","小諸",'45197',"1968-12-21")

	dict_aa = dict_append_proc (dict_aa,"t2025","岡谷",'24376',"1968-11-25")
	dict_aa = dict_append_proc (dict_aa,"t2026","塩尻",'78945',"1968-1-26")
	dict_aa = dict_append_proc (dict_aa,"t2027","茅野",'76184',"1968-1-21")
	dict_aa = dict_append_proc (dict_aa,"t2028","飯田",'34972',"1968-3-7")
	dict_aa = dict_append_proc (dict_aa,"t2029","中野",'94813',"1968-2-12")
	dict_aa = dict_append_proc (dict_aa,"t2030","諏訪",'43795',"1968-1-14")
	dict_aa = dict_append_proc (dict_aa,"t2031","駒ヶ根",'51329',"1968-8-9")
	dict_aa = dict_append_proc (dict_aa,"t2032","佐久",'54678',"1968-12-15")
	dict_aa = dict_append_proc (dict_aa,"t2033","伊那",'79231',"1968-12-21")
	dict_aa = dict_append_proc (dict_aa,"t2034","千曲",'42689',"1968-2-24")

	return	dict_aa


// ------------------------------------------------------------------
print '*** 開始 ***'

uri_target = "http://host_dbase:5984/city/cities"

user = ""
password = ""

uri_collection  = "http://host_dbase:5984/city"

// couch_manipulate.data_delete_proc (uri_collection,user,password)
get_uri.rest_delete_proc (uri_collection,user,password)

dict_aa = data_prepare_proc ()

str_json = JsonConvert.SerializeObject (dict_aa)


res = get_uri.put_uri_string_proc (uri_target,str_json,user,password)

print res

print "*** 終了 ***"

// ------------------------------------------------------------------
