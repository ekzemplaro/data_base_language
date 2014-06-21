// -----------------------------------------------------------------
//	text_create.scala
//
//					Jun/10/2013
//
// -----------------------------------------------------------------
import java.io._
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object text_create
{
def main( args: Array[String])
{
	println	("*** 開始 ***")

	if (0 < args.length)
		{
		val file_in=args(0)
		val dict_aa = data_prepare_proc ()

		text_manipulate.text_write_proc (file_in,dict_aa);
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

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2381","名古屋",45173,"1998-8-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2382","豊橋",67359,"1998-5-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2383","岡崎",86193,"1998-2-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2384","一宮",73542,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2385","蒲郡",41795,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2386","常滑",69274,"1998-10-27")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2387","大府",31562,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2388","瀬戸",95328,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2389","犬山",27135,"1998-10-14")


	dict_aa
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
