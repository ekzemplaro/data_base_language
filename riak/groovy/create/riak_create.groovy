// ---------------------------------------------------------------------
//	create/riak_create.groovy
//
//					May/30/2013
//
// ---------------------------------------------------------------------
import groovy.json.*

import net_manipulate
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def url_base = "http://localhost:8098/riak/shimane"

	def type_json = "application/json"

	def dict_aa = data_prepare_proc ()

	dict_aa.each
		{
		key,value ->
		def json = new JsonBuilder()
		json (value)

		def str_json = json.toString ()

		url_target = url_base + "/" + key;
		net_manipulate.rest_put_proc (url_target,str_json,type_json)
		}

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
static data_prepare_proc ()
{
	def dict_aa = new HashMap()
	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t3251","松江",21478,"1999-3-14")
	dict_aa = ff.dict_append_proc (dict_aa,"t3252","出雲",28974,"1999-8-12")
	dict_aa = ff.dict_append_proc (dict_aa,"t3253","大田",92635,"1999-11-5")
	dict_aa = ff.dict_append_proc (dict_aa,"t3254","雲南",54756,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t3255","江津",23471,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t3256","浜田",18193,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t3257","益田",24578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t3258","安来",63291,"1999-3-17")

	return	dict_aa
}
// -------------------------------------------------------------------
