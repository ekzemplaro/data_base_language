// ---------------------------------------------------------------------
//	read/couch_read.groovy
//
//					Jun/23/2014
//
// ---------------------------------------------------------------------
import groovy.json.*
import net_manipulate
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

//	data.keySet().each { key -> println key }

	println data["total_rows"]
//
	data["rows"].each {unit ->
		def url_target = url_collection + "/" + unit["key"]
		def str_unit = net_manipulate.get_uri_proc (url_target,"application/json")
		def slurper_unit = new JsonSlurper()
		def unit_aa = slurper_unit.parseText (str_unit)
		print (unit["key"] + "\t")
		print (unit_aa.name + "\t")
		print (unit_aa.population + "\t")
		println (unit_aa.date_mod)
		}

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
