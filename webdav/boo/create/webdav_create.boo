// ------------------------------------------------------------------
//	webdav_create.boo
//
//					Jan/25/2012
//
// ------------------------------------------------------------------
import	System

import	Newtonsoft.Json
// ------------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t1351","八王子",'71584',"1968-5-21")
	dict_aa = dict_append_proc (dict_aa,"t1352","立川",'48617',"1968-8-6")
	dict_aa = dict_append_proc (dict_aa,"t1353","武蔵野",'92831',"1968-3-8")
	dict_aa = dict_append_proc (dict_aa,"t1354","三鷹",'54197',"1968-12-15")

	dict_aa = dict_append_proc (dict_aa,"t1355","青梅",'28976',"1968-11-25")
	dict_aa = dict_append_proc (dict_aa,"t1356","府中",'92345',"1968-1-26")
	dict_aa = dict_append_proc (dict_aa,"t1357","昭島",'61384',"1968-1-21")
	dict_aa = dict_append_proc (dict_aa,"t1358","調布",'54632',"1968-3-7")
	dict_aa = dict_append_proc (dict_aa,"t1359","町田",'23951',"1968-2-12")

	return dict_aa

// ------------------------------------------------------------------
print "*** 開始 ***"

uri_target = "http://host_dbase:3004/city/tokyo.json"
user = ""
passwd = ""

dict_aa = data_prepare_proc ()

str_json = JsonConvert.SerializeObject (dict_aa)


res = get_uri.put_uri_string_proc (uri_target,str_json,user,passwd)

print res

print "*** 終了 ***"

// ------------------------------------------------------------------
