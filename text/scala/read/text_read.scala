// -----------------------------------------------------------------
//	text_read.scala
//
//						Sep/05/2016
// -----------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object text_read
{
// -----------------------------------------------------------------
def main (args: Array[String])
{
	System.err.println ("*** 開始 ***")

	if (0 < args.length)
		{
		val file_in = args(0)

		var dict_aa = text_manipulate.text_read_proc (file_in)
		text_manipulate.dict_display_proc (dict_aa)
		}
	else
		{
		Console.err.println ("*** error ***")
		}

	System.err.println ("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
