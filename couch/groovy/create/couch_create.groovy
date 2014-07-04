// ---------------------------------------------------------------------
//	create/couch_create.groovy
//
//					Jun/23/2014
//
// ---------------------------------------------------------------------
import groovy.json.*

import net_manipulate
// ---------------------------------------------------------------------
class couch_create
{
// -------------------------------------------------------------------
static data_prepare_proc ()
{
	def dict_aa = new HashMap()
	def ff = new text_manipulate ()
	dict_aa = ff.dict_append_proc (dict_aa,"t2021","長野",78214,"1999-7-24")
	dict_aa = ff.dict_append_proc (dict_aa,"t2022","松本",18679,"1999-2-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t2023","上田",89532,"1999-7-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t2024","小諸",24856,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t2025","岡谷",39125,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t2026","塩尻",15736,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t2027","茅野",23571,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t2028","飯田",14687,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t2029","中野",43715,"1999-10-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t2030","諏訪",83526,"1999-7-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t2031","駒ヶ根",34815,"1999-3-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t2032","佐久",45719,"1999-6-18")
	dict_aa = ff.dict_append_proc (dict_aa,"t2033","伊那",98143,"1999-8-15")
	dict_aa = ff.dict_append_proc (dict_aa,"t2034","千曲",51237,"1999-9-27")

	return	dict_aa
}
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def url_collection = "http://localhost:5984/nagano"


	def type_json = "application/json"

	def dict_aa = data_prepare_proc ()

	net_manipulate.rest_delete_proc (url_collection)
	net_manipulate.rest_put_proc (url_collection,"{}",type_json)

	dict_aa.keySet().each { key ->
		def url_target = url_collection + "/" + key
		def unit_aa = dict_aa[key]
		def json = new JsonBuilder()
		json (unit_aa)
		def str_json_out = json.toString ()

		net_manipulate.rest_put_proc (url_target,str_json_out,type_json)
		}

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
