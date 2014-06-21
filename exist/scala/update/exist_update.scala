// --------------------------------------------------------------
/*
	exist_update.scala

				Jul/20/2011

*/
// --------------------------------------------------------------


// --------------------------------------------------------------
object exist_update {
// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	var	id = args(0)
	var	population = args(1).toInt
	print ("\tid = " + id)
	println ("\tpopulation = " + population)

	def uri = "http://admin:hello9@cpt003:8086/exist/rest/db"

	def collections = "cities"
	def xml_file = "cities.xml"

	def uri_aa = uri + "/" + collections + "/" + xml_file

	def xml_str = get_uri.get_uri_proc (uri_aa)

	val keys = Array ("t4251","t4252","t4253",
			"t4254","t4255","t4256",
			"t4257","t4258","t4259")

	var dict_aa = xml_manipulate.xml_to_dict_proc (xml_str,keys)

	dict_aa = text_manipulate.dict_update_proc (dict_aa,id,population)

	text_manipulate.dict_display_proc (dict_aa)

	def str_out_aa = xml_manipulate.dict_to_xml_proc (dict_aa)

	get_uri.rest_put_proc (uri_aa,str_out_aa,"text/xml")

	println ("***** 終了 *****")
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
