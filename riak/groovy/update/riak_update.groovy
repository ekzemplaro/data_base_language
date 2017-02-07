// ---------------------------------------------------------------------
//	update/riak_update.groovy
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

	def key_in=args[0]
	def population_in=args[1]
	println (key_in + "\t" +  population_in)

	def url_target = "http://localhost:8098/riak/shimane/" + key_in
	def type_json = "application/json"

	def json_str = net_manipulate.get_uri_proc (url_target,type_json)

	def slurper = new JsonSlurper()
	def unit_aa = slurper.parseText (json_str)

	def today = new Date ().format ("yyyy-MM-dd")

	unit_aa['population'] = population_in
	unit_aa['date_mod'] = today

	def json = new JsonBuilder()
	
	json (unit_aa)

	def str_json_new = json.toString ()

	net_manipulate.rest_put_proc (url_target,str_json_new,type_json)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
