// -----------------------------------------------------------------
//	json_manipulate.scala
//
//						Jun/11/2013
//
// -----------------------------------------------------------------
import scala.util.parsing.json.JSONObject
import scala.util.parsing.json.JSON
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object json_manipulate {

// -----------------------------------------------------------------
def json_to_dict_proc (str_json:String):(mutable.Map[String,Object]) = {
	var dict_aa = mutable.Map[String,Object] ()

	val aaa = JSON.parse(str_json)

//	println ("json_to_dict_proc *** aaa ***")
	aaa.foreach (bbb =>
		{
		bbb.foreach (ccc =>
			{
			val (kx:String,_) = ccc

//			println (kx)

			if ((kx != "_id") && (kx != "_rev"))
				{
			val (key:String,value:List[_]) = ccc
				dict_aa(key) = json_to_dict_proc_s2 (value)
				}
			else
				{
				val (key:String,value:String) = ccc
				dict_aa(key) = value
				}
			})
		})

	dict_aa
}

// -----------------------------------------------------------------
def json_to_dict_proc_s2 (value:List[_]):(mutable.Map[String,String]) = {
	var unit_aa = mutable.Map[String,String] ()
	value.foreach (ddd => 
		{
		val (kk:String,vv:Object) = ddd
		unit_aa(kk) = vv.toString ()
		})
	unit_aa
}


// -----------------------------------------------------------------
def dict_to_json_proc (dict_aa: mutable.Map[String,Object]): String = {
	var dict_bb = mutable.Map[String,Object] ()

	for (pair <- dict_aa)
		{
		val key = pair._1
		if ((key != "_id") && (key != "_rev"))
			{
			var unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]
				val unit_bb = unit_aa.toMap
			val obj_bb = JSONObject (unit_bb)
			dict_bb(key) = obj_bb
			}
		else
			{
			dict_bb(key) = pair._2
			}
		}

	val dict_cc = dict_bb.toMap
	val obj = JSONObject (dict_cc)
	val json_str = obj.toString ()

	json_str
}

// -----------------------------------------------------------------
def json_display (str_json:String)
{
	val aaa = JSON.parse(str_json)

	aaa.foreach (bbb =>
		{
		bbb.foreach (ccc =>
			{
			record_parser (ccc)
			})
		})
}

// -----------------------------------------------------------------
def record_parser (ccc: Any)
{
	val (kkk:String,vvv:List[_]) = ccc

	vvv.foreach (uuu =>
		{
		val ttt = uuu.asInstanceOf[List[(_,_)]]
		ttt.foreach (sss =>
			{
			val (kka,vva) = sss
			print (vva + "\t")
			})
		println ()
		})
}

// -----------------------------------------------------------------
def unit_json_gen_proc (name:String,population:Int,date_mod:String):String = {
	var unit_aa = mutable.Map[String,String] ()
	unit_aa("name") = name
	unit_aa("population") = "%d".format (population)
	unit_aa("date_mod") = date_mod
	val unit_bb = unit_aa.toMap
	val obj = JSONObject (unit_bb)
	val json_str = obj.toString ()

	json_str
}

/*
	"{\"name\": \"" + name + "\"," +
	"\"population\": " + population + "," +
	"\"date_mod\": \"" + date_mod + "\"}\n"
*/
// --------------------------------------------------------------
def json_to_unit_proc (str_json:String):(mutable.Map[String,String]) = {

	var unit_aa = mutable.Map[String,String] ()


	for (tpl <- JSON.parse(str_json).get) {
		tpl match {
		case (t1:String, t2:String) if(t1 == "name") => unit_aa("name") = t2 
		case (t1:String, t2:Double) if(t1 == "population") => unit_aa("population") = "%1.0f" format t2
		case (t1:String, t2:Int) if(t1 == "population") => unit_aa("population") = t2.toString
		case (t1:String, t2:String) if(t1 == "population") => unit_aa("population") = t2
		case (t1:String, t2:String) if(t1 == "date_mod") => unit_aa("date_mod") = t2
		case _ =>
		}
	}

	unit_aa
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------

