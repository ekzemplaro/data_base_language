// --------------------------------------------------------------
//	webdav_delete.scala
//
//					Mar/28/2013
// --------------------------------------------------------------
import	scala.collection.mutable

// --------------------------------------------------------------
object webdav_delete
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	var	key_in = args(0)
	println ("\tkey_in = " + key_in)

	val uri= "http://cddn007:3004/city/tokyo.json"

	val str_json = get_uri.get_uri_proc (uri)

	var dict_aa = json_manipulate.json_to_dict_proc (str_json)

	if (dict_aa.contains (key_in))
		{
		dict_aa = text_manipulate.dict_delete_proc (dict_aa,key_in)

		text_manipulate.dict_display_proc (dict_aa)

		val json_new = json_manipulate.dict_to_json_proc (dict_aa)

		get_uri.rest_put_proc (uri,json_new,"text/json")
		}

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
