// ---------------------------------------------------------------------
//	read/exist_read.groovy
//
//					Jul/20/2011
//
// ---------------------------------------------------------------------
import get_uri
import xml_manipulate

// ---------------------------------------------------------------------
class exist_read
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def collections = 'cities'
	def xml_file = 'cities.xml'
	def uri= "http://admin:tiger@localhost:8086/exist/rest/db/" + 
		collections + "/" + xml_file

	def ee = new net_manipulate ()

	def xml_str = ee.get_uri_proc (uri,"text/xml")

//	print	xml_str

	def dd = new xml_manipulate ()
	def dict_aa = dd.xml_to_dict_proc (xml_str)

	def ff = new text_manipulate ()

	ff.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
