// -----------------------------------------------------------------
//	couch_create.scala
//
//					Jun/23/2014
//
// -----------------------------------------------------------------
import scala.collection.mutable
import scala.util.parsing.json.JSONObject

// -----------------------------------------------------------------
object couch_create
{
def main (args: Array[String])
{
	println	("*** 開始 ***")

	val url_collection = "http://localhost:5984/nagano"

	get_uri.rest_delete_proc (url_collection)
	get_uri.rest_put_proc (url_collection,"{}","text/json")

	val dict_aa = data_prepare_proc ()

	for (pair <- dict_aa)
		{
		val key = pair._1
		val unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]
		val unit_bb = unit_aa.toMap
		val obj = JSONObject (unit_bb)
		val json_str_new = obj.toString ()
//		println (json_str_new)
		val url_target = url_collection + "/" + key 
		get_uri.rest_put_proc (url_target,json_str_new,"text/json")
		}

	println	("*** 終了 ***")

}
// -----------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2021","長野",32945,"1998-8-5")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2022","松本",67381,"1998-6-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2023","上田",86173,"1998-5-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2024","小諸",73542,"1998-4-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2025","岡谷",41895,"1998-2-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2026","塩尻",69423,"1998-1-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2027","茅野",32897,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2028","飯田",85128,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2029","中野",27315,"1998-10-14")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2030","諏訪",35921,"1998-5-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2031","駒ヶ根",89276,"1998-7-3")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2032","佐久",42367,"1998-9-9")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2033","伊那",87192,"1998-2-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2034","千曲",78916,"1998-4-25")

	dict_aa
}
// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
