// -----------------------------------------------------------------
//	webdav_create.scala
//
//					Mar/28/2013
//
// -----------------------------------------------------------------
import scala.collection.mutable
// -----------------------------------------------------------------
object webdav_create
{
def main (args: Array[String])
{
	println	("*** 開始 ***")

	val uri_target = "http://cddn007:3004/city/tokyo.json"

	val dict_aa = data_prepare_proc ()

	text_manipulate.dict_display_proc (dict_aa)
 
	val json_str = json_manipulate.dict_to_json_proc (dict_aa)

//	println (json_str)
	get_uri.rest_put_proc (uri_target,json_str,"text/json")

	println	("*** 終了 ***")

}
// -----------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1351","八王子",32945,"1998-8-5")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1352","立川",67381,"1998-6-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1353","武蔵野",86173,"1998-5-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1354","三鷹",73542,"1998-4-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1355","青梅",41895,"1998-2-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1356","府中",69423,"1998-1-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1357","昭島",32897,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1358","調布",75128,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1359","町田",27365,"1998-10-14")

	dict_aa
}
// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
