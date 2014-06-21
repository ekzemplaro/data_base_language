// --------------------------------------------------------------
//	update/couch_update.scala
//
//					Mar/12/2013
// --------------------------------------------------------------
import	scala.collection.mutable

// --------------------------------------------------------------
object couch_update
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	var	id = args(0)
	var	population = args(1).toInt
	print ("\tid = " + id)
	println ("\tpopulation = " + population)

	val uri= "http://cddn007:5984/city/cities"

	val str_json = get_uri.get_uri_proc (uri)

//	println	(str_json)

	var dict_aa = json_manipulate.json_to_dict_proc (str_json)

	dict_aa = text_manipulate.dict_update_proc (dict_aa,id,population)

	text_manipulate.dict_display_proc (dict_aa)

//	println ("_id = " + dict_aa.get ("_id").get)
//	println ("_rev = " + dict_aa.get ("_rev").get)

	val json_new = json_manipulate.dict_to_json_proc (dict_aa)

	get_uri.rest_put_proc (uri,json_new,"text/json")

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
