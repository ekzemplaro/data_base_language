// --------------------------------------------------------------
//	webdav_update.scala
//
//					Mar/28/2013
// --------------------------------------------------------------
import	scala.collection.mutable

// --------------------------------------------------------------
object webdav_update
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	var	id = args(0)
	var	population = args(1).toInt
	print ("\tid = " + id)
	println ("\tpopulation = " + population)

	val uri= "http://cddn007:3004/city/tokyo.json"

	val str_json = get_uri.get_uri_proc (uri)

//	println	(str_json)

	var dict_aa = json_manipulate.json_to_dict_proc (str_json)

	dict_aa = text_manipulate.dict_update_proc (dict_aa,id,population)

	text_manipulate.dict_display_proc (dict_aa)


	val json_new = json_manipulate.dict_to_json_proc (dict_aa)

	get_uri.rest_put_proc (uri,json_new,"text/json")

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
