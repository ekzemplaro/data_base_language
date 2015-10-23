// -------------------------------------------------------------------
//	json_delete.groovy
//
//					Mar/12/2013
//
// -------------------------------------------------------------------
import groovy.json.*

import text_manipulate
// -------------------------------------------------------------------
class json_delete
{

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def file_in = args[0]
	def key_in = args[1]

	println (key_in)

	def json_str = new File (file_in).text
	
	def slurper = new JsonSlurper()
	def dict_aa = slurper.parseText (json_str)

	if (dict_aa.containsKey (key_in))
		{
		dict_aa = text_manipulate.dict_delete_proc (dict_aa,key_in)

		def json = new JsonBuilder()

		json (dict_aa)

		def str_json = json.toString ()

		def gg = new File (file_in)
		gg.write (str_json)
		}

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------

