// -----------------------------------------------------------------
//	json_create.scala
//
//					Jan/23/2015
//
// -----------------------------------------------------------------
import java.io._
import scala.collection.mutable

import org.json4s._
import org.json4s.native.Serialization
import org.json4s.native.Serialization.write

// -----------------------------------------------------------------
object json_create
{

// -----------------------------------------------------------------
def main (args: Array[String])
{
	println	("*** 開始 ***")

	if (0 < args.length)
		{
		val json_file = args(0)

		val dict_aa = data_prepare_proc ()

		val json_str = json_manipulate.dict_to_json_proc (dict_aa)

//		println (json_str)
 
		val out = new java.io.FileWriter (json_file)
		out.write (json_str)
		out.close
		}
	else
		{
		scala.Console.err.println ("*** error ***")
		}

	println	("*** 終了 ***")

}

// -----------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0921","宇都宮",17526,"1998-9-15")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0922","小山",67381,"1998-8-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0923","佐野",56123,"1998-7-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0924","足利",73542,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0925","日光",41895,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0926","下野",94236,"1998-1-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0927","さくら",37892,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0928","矢板",45728,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0929","真岡",27165,"1998-10-14")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0930","栃木",35812,"1998-5-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0931","大田原",84176,"1998-7-3")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0932","鹿沼",42547,"1998-9-9")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0933","那須塩原",82571,"1998-2-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0934","那須烏山",24782,"1998-4-25")

	dict_aa
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
