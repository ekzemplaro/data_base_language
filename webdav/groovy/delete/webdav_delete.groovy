// ---------------------------------------------------------------------
//	webdav_delete.groovy
//
//					Mar/28/2013
//
// ---------------------------------------------------------------------
import groovy.json.*

import net_manipulate
import text_manipulate
// ---------------------------------------------------------------------
class webdav_delete
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def key_in=args[0]
	println (key_in)

	def uri_work= "http://cddn007:3004/city/tokyo.json"
	def type_json = "application/json"

	def json_str = net_manipulate.get_uri_proc (uri_work,type_json)

	def slurper = new JsonSlurper()
	def dict_aa = slurper.parseText (json_str)

	if (dict_aa.containsKey (key_in))
		{
		dict_aa = text_manipulate.dict_delete_proc (dict_aa,key_in)

		def json = new JsonBuilder()

		json (dict_aa)

		def str_json = json.toString ()

		net_manipulate.rest_put_proc (uri_work,str_json,type_json)
		}

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
