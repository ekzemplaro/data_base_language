// -----------------------------------------------------------------
//	xml_delete.scala
//
//						Mar/03/2018
// -----------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object xml_delete
{
// -----------------------------------------------------------------
def main (args: Array[String])
{
	System.err.println	("*** 開始 ***")

	val xml_file = args(0)
	val id_in = args(1)

	println (id_in)

	val xml_str = file_io.file_to_str_proc (xml_file)

	val keys = Array ("t2261","t2262","t2263",
			"t2264","t2265","t2266",
			"t2267","t2268","t2269")

	var dict_aa = xml_manipulate.xml_to_dict_proc (xml_str,keys)

	dict_aa = text_manipulate.dict_delete_proc (dict_aa,id_in)

	val out_str = xml_manipulate.dict_to_xml_proc (dict_aa)

	file_io.file_write_proc (xml_file,out_str)

	System.err.println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
