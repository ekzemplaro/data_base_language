// --------------------------------------------------------------
//
//	epub_delete.scala
//
//					Jan/10/2012
// --------------------------------------------------------------
import java.lang.System

import java.io.IOException
import org.xml.sax.SAXException

import	java.util.HashMap
// --------------------------------------------------------------
object epub_delete
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val file_epub=args(0)
	val id_in=args(1)

	println (id_in)

	var dict_aa = tika_manipulate.tika_parse (file_epub,"epub_delete")

	dict_aa = text_manipulate.dict_delete_proc (dict_aa,id_in)

	text_manipulate.dict_display_proc (dict_aa)

	epub_manipulate.dict_to_epub_proc(file_epub,dict_aa)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
