// ---------------------------------------------------------------------
//	read/couch_read.groovy
//
//					May/07/2015
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
	def url_all_docs = url_collection + "/_all_docs?include_docs=true"

	def str_json = net_manipulate.get_uri_proc (url_all_docs,"application/json")

	def slurper = new JsonSlurper()
	def data = slurper.parseText (str_json)

	println data["total_rows"]

	def dict_aa = new HashMap()

	data["rows"].each {unit ->
		def key = unit["key"]
		dict_aa[key] = unit["doc"]
		}

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
