// ---------------------------------------------------------------------
//	delete/exist_delete.groovy
//
//					Nov/05/2013
//
// ---------------------------------------------------------------------
import xml_manipulate
import net_manipulate

// ---------------------------------------------------------------------
class exist_delete
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def id_in = args[0]

	println (id_in)

	def collections = 'cities'
	def xml_file = 'cities.xml'
	def uri= "http://admin:tiger@localhost:8086/exist/rest/db/" + 
		collections + "/" + xml_file

	def type = "text/xml"

	def xml_str = net_manipulate.get_uri_proc (uri,type)

	def dd = new xml_manipulate ()
	def dict_aa = dd.xml_to_dict_proc (xml_str)

	def ff = new text_manipulate ()
	def dict_bb = ff.dict_delete_proc (dict_aa,id_in)

	def str_out = dd.dict_to_xml_proc (dict_bb)

	net_manipulate.rest_put_proc (uri,str_out,type)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
