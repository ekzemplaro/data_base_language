// -----------------------------------------------------------------
//	xindice_read.scala
//
//						Jul/20/2011
// -----------------------------------------------------------------
import scala.io.Source

// -----------------------------------------------------------------
object xindice_read
{
// -----------------------------------------------------------------
def main( args: Array[String] )
{
	println	("*** 開始 ***")

	val url_in="http://cdbd026:8888/xindice/db/cities/cities"

//	val xml_str = get_uri.get_uri_proc (url_in)
	val xml_str = file_io.url_to_str_proc (url_in)

	val keys = Array ("t0271","t0272","t0273",
			"t0274","t0275","t0276",
			"t0277","t0278","t0279")

	val dict_aa = xml_manipulate.xml_to_dict_proc (xml_str,keys)

	text_manipulate.dict_display_proc (dict_aa)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
