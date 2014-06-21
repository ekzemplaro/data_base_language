// -----------------------------------------------------------------
//	couch_create.scala
//
//					Mar/12/2013
//
// -----------------------------------------------------------------
import scala.collection.mutable
// -----------------------------------------------------------------
object couch_create
{
def main (args: Array[String])
{
	println	("*** 開始 ***")

	val uri_collection = "http://cddn007:5984/city"
	val uri_target = uri_collection + "/cities"

	val dict_aa = data_prepare_proc ()

	val str_json = get_uri.get_uri_proc (uri_target)

	var dict_org = json_manipulate.json_to_dict_proc (str_json)

	println ("_id = " + dict_org.get ("_id").get)
	println ("_rev = " + dict_org.get ("_rev").get)

	dict_aa("_id") = dict_org.get ("_id").get
	dict_aa("_rev") = dict_org.get ("_rev").get

	text_manipulate.dict_display_proc (dict_aa)
 
	val json_str = json_manipulate.dict_to_json_proc (dict_aa)

//	println (json_str)
	get_uri.rest_put_proc (uri_target,json_str,"text/json")

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
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2029","中野",27365,"1998-10-14")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2030","諏訪",35921,"1998-5-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2031","駒ヶ根",84276,"1998-7-3")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2032","佐久",42567,"1998-9-9")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2033","伊那",87192,"1998-2-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2034","千曲",78256,"1998-4-25")

	dict_aa
}
// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
