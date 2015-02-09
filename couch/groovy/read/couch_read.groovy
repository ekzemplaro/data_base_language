// ---------------------------------------------------------------------
//	read/couch_read.groovy
//
//					Feb/04/2015
//
// ---------------------------------------------------------------------
import groovy.json.*
import net_manipulate
import text_manipulate
// ---------------------------------------------------------------------
class couch_read
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def url_collection = "http://localhost:5984/nagano"

	def str_json = net_manipulate.get_uri_proc (url_collection + "/_all_docs","application/json")

	def slurper = new JsonSlurper()
	def data = slurper.parseText (str_json)

	println data["total_rows"]

	def dict_aa = new HashMap()

	data["rows"].each {unit ->
		def url_target = url_collection + "/" + unit["key"]
		def str_unit = net_manipulate.get_uri_proc (url_target,"application/json")
		def slurper_unit = new JsonSlurper()
		def unit_aa = slurper_unit.parseText (str_unit)

		def key = unit["key"]
		dict_aa[key] = unit_aa
		}

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
