// ---------------------------------------------------------------------
//	update/xindice_update.groovy
//
//					Jan/26/2011
//
// ---------------------------------------------------------------------
import xml_manipulate
import net_manipulate

// ---------------------------------------------------------------------
class xindice_update
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def id_in = args[0]
	def population_in = args[1]

	println (id_in + "\t" + population_in)

	def uri= "http://cdbd026:8888/xindice/db/cities/cities"

	def type = "text/xml"

	def xml_str = net_manipulate.get_uri_proc (uri,type)

	def dd = new xml_manipulate ()
	def dict_aa = dd.xml_to_dict_proc (xml_str)

	def ff = new text_manipulate ()
	def dict_bb = ff.dict_update_proc (dict_aa,id_in,population_in)

	def str_out = dd.dict_to_xml_proc (dict_bb)

	net_manipulate.rest_put_proc (uri,str_out,type)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
