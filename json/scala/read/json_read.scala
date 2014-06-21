// -----------------------------------------------------------------
//	read/json_read.scala
//
//						Jul/17/2011
//
// -----------------------------------------------------------------
import scala.util.parsing.json.JSON
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object json_read {

// -----------------------------------------------------------------
def main( args: Array[String] )
{
	println	("*** 開始 ***")

	val file_in = args(0)

	val source = Source.fromFile (file_in)

	var str_json=""

	for( line <- source.getLines )
		{
		str_json += line
		}

	var dict_aa = json_manipulate.json_to_dict_proc (str_json)

	text_manipulate.dict_display_proc (dict_aa)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}

// -----------------------------------------------------------------
