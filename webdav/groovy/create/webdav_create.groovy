// ---------------------------------------------------------------------
//	webdav_create.groovy
//
//					Nov/05/2013
//
// ---------------------------------------------------------------------
import groovy.json.*

import net_manipulate
// ---------------------------------------------------------------------
class webdav_create
{
// -------------------------------------------------------------------
static data_prepare_proc ()
{
	def dict_aa = new HashMap()
	def ff = new text_manipulate ()
	dict_aa = ff.dict_append_proc (dict_aa,"t1351","八王子",39278,"1999-7-24")
	dict_aa = ff.dict_append_proc (dict_aa,"t1352","立川",51674,"1999-2-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t1353","武蔵野",79712,"1999-7-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t1354","三鷹",94256,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t1355","青梅",79425,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t1356","府中",15836,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t1357","昭島",21578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t1358","調布",14683,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t1359","町田",43719,"1999-10-2")

	return	dict_aa
}
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

//	def uri_target= "http://host_dbase:3004/city/tokyo.json"
	def uri_target= "http://cddn007:3004/city/tokyo.json"
	def type_json = "application/json"

	def dict_aa = data_prepare_proc ()

	def json = new JsonBuilder()

	json (dict_aa)

	def str_json = json.toString ()

	net_manipulate.rest_put_proc (uri_target,str_json,type_json)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
