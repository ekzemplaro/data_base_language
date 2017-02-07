// -----------------------------------------------------------------
//	csv_read.scala
//
//						Jul/11/2011
// -----------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object csv_read
{
// -----------------------------------------------------------------
def main (args: Array[String])
{
	println	("*** 開始 ***")

	if (0 < args.length)
		{
		val file_in = args(0)

		var dict_aa = text_manipulate.csv_read_proc (file_in)
		text_manipulate.dict_display_proc (dict_aa)
		}
	else
		{
		Console.err.println ("*** error ***")
		}

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
