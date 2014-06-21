// ------------------------------------------------------------------
//	ftp_create.boo
//
//					Mar/12/2013
//
// ------------------------------------------------------------------
import	System

import	Newtonsoft.Json
// ------------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t0361","盛岡",'92371',"1968-5-21")
	dict_aa = dict_append_proc (dict_aa,"t0362","久慈",'48617',"1968-8-6")
	dict_aa = dict_append_proc (dict_aa,"t0363","二戸",'92831',"1968-3-8")
	dict_aa = dict_append_proc (dict_aa,"t0364","宮古",'54197',"1968-12-15")

	dict_aa = dict_append_proc (dict_aa,"t0365","遠野",'28976',"1968-11-25")
	dict_aa = dict_append_proc (dict_aa,"t0366","八幡平",'92345',"1968-1-26")
	dict_aa = dict_append_proc (dict_aa,"t0367","大船渡",'61384',"1968-1-21")
	dict_aa = dict_append_proc (dict_aa,"t0368","一関",'54632',"1968-3-7")
	dict_aa = dict_append_proc (dict_aa,"t0369","花巻",'23951',"1968-2-12")

	return dict_aa

// ------------------------------------------------------------------
print "*** 開始 ***"

url_in = "ftp://host_dbase/city/iwate.json"
user = "scott"
passwd = "tiger"

dict_aa = data_prepare_proc ()

str_json = JsonConvert.SerializeObject (dict_aa)

ftp_manipulate.str_to_ftp_proc (url_in,user,passwd,str_json)

print "*** 終了 ***"

// ------------------------------------------------------------------
