// --------------------------------------------------------------
/*
	create/exist_create.scala

				Jul/20/2011

*/
// --------------------------------------------------------------
import scala.collection.mutable

// --------------------------------------------------------------
object exist_create {
// --------------------------------------------------------------
def main (args: Array[String])
{
	println("*** 開始 *** exist_create ***")

	def uri = "http://admin:hello9@cpt003:8086/exist/rest/db"

	def collections = "cities"
	def xml_file = "cities.xml"

	def uri_aa = uri + "/" + collections + "/" + xml_file

	val dict_aa = data_prepare_proc ()

	var str_xml_out = xml_manipulate.dict_to_xml_proc (dict_aa)

	get_uri.rest_put_proc (uri_aa,str_xml_out,"text/xml")

	println("***** 終了 *****")
}
 
// --------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4251","長崎",67329,"1998-4-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4252","佐世保",32915,"1998-8-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4253","島原",86173,"1998-7-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4254","大村",73542,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4255","諫早",41795,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4256","五島",69274,"1998-1-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4257","平戸",32562,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4258","雲仙",85328,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4259","松浦",27135,"1998-10-14")

	dict_aa
} 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
