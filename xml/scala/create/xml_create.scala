// -----------------------------------------------------------------
//	xml_create.scala
//
//					Mar/03/2018
//
// -----------------------------------------------------------------
import java.io._
import scala.collection.mutable

// -----------------------------------------------------------------
object xml_create
{
// -----------------------------------------------------------------
def main (args: Array[String])
{
	System.err.println	("*** 開始 ***")

	if (0 < args.length)
		{
		val xml_file = args(0)

		val dict_aa = data_prepare_proc ()

		val out_str = xml_manipulate.dict_to_xml_proc (dict_aa)

		file_io.file_write_proc (xml_file,out_str)
		}
	else
		{
		scala.Console.err.println ("*** error ***")
		}

	System.err.println	("*** 終了 ***")

}
// -----------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2261","静岡",67321,"1998-4-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2262","浜松",41389,"1998-8-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2263","沼津",86143,"1998-7-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2264","三島",73542,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2265","富士",41895,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2266","熱海",62894,"1998-1-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2267","富士宮",31892,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2268","藤枝",84128,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2269","御殿場",97135,"1998-10-14")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2270","島田",29518,"1998-4-8")

	dict_aa
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
