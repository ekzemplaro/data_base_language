// -----------------------------------------------------------------
//	json_manipulate.scala
//
//						Jan/27/2015
//
// -----------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

import scala.io.Source
import org.json4s._
import org.json4s.native.JsonMethods._

import org.json4s.native.Serialization
import org.json4s.native.Serialization.write
// -----------------------------------------------------------------
object json_manipulate {

// -----------------------------------------------------------------
def json_to_dict_proc (keys:Array [String],str_json:String):(mutable.Map[String,Object]) = {
	var dict_aa = mutable.Map[String,Object] ()

	val json = parse (str_json)

	for (key <- keys)
		{
		val unit = json \ key
		if (unit.values != None)
			{
			var unit_aa = mutable.Map[String,String] ()
			val name = (unit \ "name").values
			val population = (unit \ "population").values
			val date_mod = (unit \ "date_mod").values
			unit_aa("name") = name.toString
			unit_aa("population") = population.toString
			unit_aa("date_mod") = date_mod.toString
			dict_aa(key) = unit_aa
			}
		}

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

	implicit val formats = Serialization.formats(NoTypeHints)

	val json_str = write (dict_aa)

	json_str
}

// -----------------------------------------------------------------
def json_display (str_json:String)
{
/*
	val aaa = JSON.parseFull(str_json)

	aaa.foreach (bbb =>
		{
		bbb.foreach (ccc =>
			{
			record_parser (ccc)
			})
		})
*/
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
	implicit val formats = Serialization.formats(NoTypeHints)

	var unit_aa = mutable.Map[String,String] ()
	unit_aa("name") = name
	unit_aa("population") = "%d".format (population)
	unit_aa("date_mod") = date_mod

	val json_str = write (unit_aa)

	json_str
}

// --------------------------------------------------------------
def json_to_unit_proc (str_json:String):(mutable.Map[String,String]) = {

	var unit_aa = mutable.Map[String,String] ()
/*

	for (tpl <- JSON.parseFull(str_json).get) {
		tpl match {
		case (t1:String, t2:String) if(t1 == "name") => unit_aa("name") = t2 
		case (t1:String, t2:Double) if(t1 == "population") => unit_aa("population") = "%1.0f" format t2
		case (t1:String, t2:Int) if(t1 == "population") => unit_aa("population") = t2.toString
		case (t1:String, t2:String) if(t1 == "population") => unit_aa("population") = t2
		case (t1:String, t2:String) if(t1 == "date_mod") => unit_aa("date_mod") = t2
		case _ =>
		}
	}
*/
	unit_aa
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------

