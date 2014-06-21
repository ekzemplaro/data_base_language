// -----------------------------------------------------------------
//	riak_create.scala
//
//					Jun/10/2013
//
// -----------------------------------------------------------------
import scala.util.parsing.json.JSONObject
import scala.collection.mutable
import scala.collection.immutable
// -----------------------------------------------------------------
object riak_create
{
def main (args: Array[String])
{
	println	("*** 開始 ***")

	val url_base="http://localhost:8098/riak/shimane"

	val dict_aa = data_prepare_proc ()

	text_manipulate.dict_display_proc (dict_aa)

	for (pair <- dict_aa)
		{
		val key = pair._1
//		println (key)
		val unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]
		val unit_bb = unit_aa.toMap
		val obj = JSONObject (unit_bb)
		val json_str = obj.toString ()
//		println (json_str)
		val uri_target = url_base + "/" + key
		get_uri.rest_put_proc (uri_target,json_str,"text/json")
		}
 

	println	("*** 終了 ***")

}
// -----------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3251","松江",41873,"1998-4-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3252","出雲",62359,"1998-8-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3253","大田",81973,"1998-7-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3254","雲南",73542,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3255","江津",41795,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3256","浜田",69274,"1998-1-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3257","益田",32562,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3258","安来",85328,"1998-9-8")
	dict_aa
}
// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
