// ---------------------------------------------------------------------
//	update/couch_update.groovy
//
//					Jun/23/2014
//
// ---------------------------------------------------------------------
import groovy.json.*

import net_manipulate
// ---------------------------------------------------------------------
class couch_update
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def key_in=args[0]
	def population_in=args[1]
	println (key_in + "\t" +  population_in)

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
	print (unit_aa.name + "\t")
	print (unit_aa.population + "\t")
	println (unit_aa.date_mod)

	unit_aa.population = population_in
	def today = new Date ().format ("yyyy-MM-dd")
	unit_aa.date_mod = today

	def json = new JsonBuilder()
	json (unit_aa)
	def str_json_new = json.toString ()

	println (str_json_new)

	net_manipulate.rest_put_proc (url_target,str_json_new,type_json)
		}

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
