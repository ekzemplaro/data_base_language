// --------------------------------------------------------------
//
//	epub_read.groovy
//
//					Jan/09/2012
// --------------------------------------------------------------
import static java.lang.System.err
import static java.lang.System.exit

import java.io.IOException
import org.xml.sax.SAXException

import	java.util.HashMap
// --------------------------------------------------------------
class epub_read
{

// --------------------------------------------------------------
static void main (args)
{
	if (args.length < 1)
		{
		err.println("USAGE: epub_read <resourceUrl>")
		exit(1)
		}

	println ("*** 開始 ***")

	def tika = new tika_manipulate ()
	def dict_aa = tika.tika_parse (args[0],"epub_read")

	def ff = new text_manipulate ()

	ff.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
