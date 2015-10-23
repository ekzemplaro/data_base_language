// -----------------------------------------------------------------
//	csv_create.scala
//
//					Jul/11/2011
//
// -----------------------------------------------------------------
import java.io._
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object csv_create
{
def main( args: Array[String])
{
	println	("*** 開始 ***")

	if (0 < args.length)
		{
		val file_in=args(0)
		val dict_aa = data_prepare_proc ()

		text_manipulate.csv_write_proc (file_in,dict_aa);
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

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1271","千葉",25673,"1998-7-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1272","勝浦",87329,"1998-8-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1273","市原",86173,"1998-3-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1274","流山",73542,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1275","八千代",32895,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1276","我孫子",32894,"1998-1-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1277","鴨川",32892,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1278","銚子",89128,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1279","市川",54137,"1998-11-14")


	dict_aa
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
