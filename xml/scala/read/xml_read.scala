// -----------------------------------------------------------------
//	xml_read.scala
//
//						Mar/03/2018
// -----------------------------------------------------------------
import scala.io.Source
import scala.xml._
import scala.collection.mutable
// -----------------------------------------------------------------
object xml_read
{
// -----------------------------------------------------------------
def main( args: Array[String] )
{
	System.err.println	("*** 開始 ***")

	if (0 < args.length)
		{
		val xml_file = args(0)

		val xml_str = file_io.file_to_str_proc (xml_file)

	//	val root = xml.XML.loadFile (xml_file)

val keys = Array ("t2261","t2262","t2263",
			"t2264","t2265","t2266",
			"t2267","t2268","t2269")

		var dict_aa = xml_manipulate.xml_to_dict_proc (xml_str,keys)
		text_manipulate.dict_display_proc (dict_aa)
		}
	else
		{
		scala.Console.err.println ("*** error ***")
		}

	System.err.println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
