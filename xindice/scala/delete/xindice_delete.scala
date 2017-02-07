// --------------------------------------------------------------
/*
	xindice_delete.scala

				Jul/20/2011

*/
// --------------------------------------------------------------

// --------------------------------------------------------------
object xindice_delete {
// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	var	id = args(0)
	println ("\tid = " + id)

	def uri_aa = "http://cdbd026:8888/xindice/db/cities/cities"

	def xml_str = get_uri.get_uri_proc (uri_aa)

	val keys = Array ("t0271","t0272","t0273",
			"t0274","t0275","t0276",
			"t0277","t0278","t0279")

	var dict_aa = xml_manipulate.xml_to_dict_proc (xml_str,keys)

	dict_aa = text_manipulate.dict_delete_proc (dict_aa,id)

	text_manipulate.dict_display_proc (dict_aa)

	def str_out_aa = xml_manipulate.dict_to_xml_proc (dict_aa)

	get_uri.rest_put_proc (uri_aa,str_out_aa,"text/xml")

	println ("***** 終了 *****")
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
