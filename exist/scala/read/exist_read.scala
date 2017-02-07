// -----------------------------------------------------------------
//	exist_read.scala
//
//						Jul/20/2011
// -----------------------------------------------------------------
import scala.io.Source

// -----------------------------------------------------------------
object exist_read
{
// -----------------------------------------------------------------
def main( args: Array[String] )
{
	println	("*** 開始 ***")

	val url_in="http://cpt003:8086/exist/rest//db/cities/cities.xml"

	val xml_str = file_io.url_to_str_proc (url_in)

	val keys = Array ("t4251","t4252","t4253",
			"t4254","t4255","t4256",
			"t4257","t4258","t4259")

	val dict_aa = xml_manipulate.xml_to_dict_proc (xml_str,keys)

	text_manipulate.dict_display_proc (dict_aa)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
