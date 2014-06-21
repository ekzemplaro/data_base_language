// ---------------------------------------------------------------------
//	update/couch_update.groovy
//
//					Mar/12/2013
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

	def id_in=args[0]
	def population_in=args[1]
	println (id_in + "\t" +  population_in)

	def uri_work= "http://cddn007:5984/city/cities"
	def type_json = "application/json"

	def json_str = net_manipulate.get_uri_proc (uri_work,type_json)

	def slurper = new JsonSlurper()
	def dict_aa = slurper.parseText (json_str)

	def ff = new text_manipulate ()

	dict_aa = ff.dict_update_proc (dict_aa,id_in,population_in)

	def json = new JsonBuilder()

	json (dict_aa)

	def json_out = json.toString ()

	net_manipulate.rest_put_proc (uri_work,json_out,type_json)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
