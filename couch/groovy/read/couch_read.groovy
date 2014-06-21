// ---------------------------------------------------------------------
//	read/couch_read.groovy
//
//					Nov/05/2013
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

	def uri= "http://cddn007:5984/city/cities"

	def json_str = net_manipulate.get_uri_proc (uri,"application/json")

//	print	json_str

	def slurper = new JsonSlurper()
	def dict_aa = slurper.parseText (json_str)

	def ff = new text_manipulate ()
	ff.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
