// ---------------------------------------------------------------------
//	delete/couch_delete.groovy
//
//					Mar/12/2013
//
// ---------------------------------------------------------------------
import groovy.json.*

import net_manipulate
import text_manipulate
// ---------------------------------------------------------------------
class couch_delete
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def key_in=args[0]
	println (key_in)

	def uri_work= "http://cddn007:5984/city/cities"
	def type_json = "application/json"

	def json_str = net_manipulate.get_uri_proc (uri_work,type_json)

	def slurper = new JsonSlurper()
	def dict_aa = slurper.parseText (json_str)

	if (dict_aa.containsKey (key_in))
		{
		dict_aa = text_manipulate.dict_delete_proc (dict_aa,key_in)

		def json = new JsonBuilder()

		json (dict_aa)

		def json_out = json.toString ()

		net_manipulate.rest_put_proc (uri_work,json_out,type_json)
		}

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
