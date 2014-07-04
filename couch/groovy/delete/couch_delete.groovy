// ---------------------------------------------------------------------
//	delete/couch_delete.groovy
//
//					Jun/23/2014
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

	def url_collection = "http://localhost:5984/nagano"

	def url_target = url_collection + "/" + key_in

	def type_json = "application/json"

	def json_str = net_manipulate.get_uri_proc (url_target,type_json)

	def slurper = new JsonSlurper()
	def unit_aa = slurper.parseText (json_str)

	if (unit_aa.containsKey ("error"))
		{
		println ("*** not exist ***")
		}
	else
		{
		println ("*** exist ***")
		def rev = unit_aa._rev
		println (rev)
		def url_delete = url_target + "?rev=" + rev
		net_manipulate.rest_delete_proc (url_delete)
		}

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
