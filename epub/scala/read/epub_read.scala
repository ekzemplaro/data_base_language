// --------------------------------------------------------------
//
//	epub_read.scala
//
//					Jan/10/2012
// --------------------------------------------------------------
import java.lang.System

import java.io.IOException
import org.xml.sax.SAXException

import	java.util.HashMap
// --------------------------------------------------------------
object epub_read
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val file_epub = args(0)

	var dict_aa = tika_manipulate.tika_parse (file_epub,"epub_read")

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
