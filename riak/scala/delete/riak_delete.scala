// --------------------------------------------------------------
//	riak_delete.scala
//
//					Jun/10/2013
// --------------------------------------------------------------
import	scala.collection.mutable

// --------------------------------------------------------------
object riak_delete
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	var	key_in = args(0)
	println ("\tkey_in = " + key_in)

	val url_base="http://localhost:8098/riak/shimane"
	val url_target= url_base + "/" + key_in

	get_uri.rest_delete_proc (url_target)
/*
	if (dict_aa.contains (key_in))
		{
		dict_aa = text_manipulate.dict_delete_proc (dict_aa,key_in)

		text_manipulate.dict_display_proc (dict_aa)

		val json_new = json_manipulate.dict_to_json_proc (dict_aa)

		get_uri.rest_put_proc (uri,json_new,"text/json")
		}
*/

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
