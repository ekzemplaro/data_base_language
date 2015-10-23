// -------------------------------------------------------------------
//	json_update.groovy
//
//					Mar/12/2013
//
// -------------------------------------------------------------------
import groovy.json.*

// -------------------------------------------------------------------
class json_update
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def file_in = args[0]
	def id_in = args[1]
	def population_in = args[2]

	println (id_in + "\t" + population_in)

	def json_str = new File (file_in).text

	def slurper = new JsonSlurper()
	def dict_aa = slurper.parseText (json_str)

	def ff = new text_manipulate ()
	dict_aa = ff.dict_update_proc (dict_aa,id_in,population_in)

	def json = new JsonBuilder()

	json (dict_aa)

	def str_json = json.toString ()
	
	def gg = new File (file_in)
	gg.write (str_json)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------

