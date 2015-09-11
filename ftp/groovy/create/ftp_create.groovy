// --------------------------------------------------------------
/*
	ftp_create.groovy
					Sep/03/2015

*/
// --------------------------------------------------------------
import groovy.json.*

import	text_manipulate
import	ftp_manipulate

// --------------------------------------------------------------
class ftp_create
{
// --------------------------------------------------------------
public static void main(String[] arg) throws Exception
{
	println ("*** 開始 ***")

	def dict_aa = data_prepare_proc ()

	def json = new JsonBuilder()

	json (dict_aa)

	def json_str = json.toString ()

// println (json_str)

	def hostname = "host_dbase"
	def user = "scott"
	def passwd = "tiger"
	def file_path = "city/iwate.json"

	ftp_manipulate.ftp_put_proc (hostname,user,passwd,file_path,json_str)

	println ("*** 終了 ***")
}


// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	def dict_aa = new HashMap <String, HashMap<String,String>> ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0361","盛岡",51276,"1999-2-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0362","久慈",69742,"1999-4-23")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0363","二戸",14873,"1999-5-24")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0364","宮古",89524,"1999-9-14")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0365","遠野",52931,"1999-8-12")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0366","八幡平",78529,"1999-7-28")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0367","大船渡",29457,"1999-6-19")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0368","一関",47362,"1999-11-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0369","花巻",56872,"1999-10-24")

	return	dict_aa
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
