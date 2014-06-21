// --------------------------------------------------------------
/*
	create/xindice_create.scala

				Jul/20/2011

*/
// --------------------------------------------------------------
import scala.collection.mutable

// --------------------------------------------------------------
object xindice_create {
// --------------------------------------------------------------
def main (args: Array[String])
{
	println("*** 開始 *** exist_create ***")

	def uri_aa = "http://cdbd026:8888/xindice/db/cities/cities";

	val dict_aa = data_prepare_proc ()

	var str_xml_out = xml_manipulate.dict_to_xml_proc (dict_aa)

	get_uri.rest_put_proc (uri_aa,str_xml_out,"text/xml")

	println("***** 終了 *****")
}
 
// --------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0271","青森",67329,"1998-4-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0272","弘前",32915,"1998-8-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0273","八戸",86173,"1998-7-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0274","三沢",73542,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0275","黒石",41795,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0276","むつ",69274,"1998-1-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0277","五所川原",32562,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0278","十和田",85328,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0279","平川",27135,"1998-10-14")

	dict_aa
}  
// --------------------------------------------------------------
}
// --------------------------------------------------------------
