// --------------------------------------------------------------
//
//	epub_update.scala
//
//					Jan/10/2012
// --------------------------------------------------------------
import java.lang.System

import java.io.IOException
import org.xml.sax.SAXException

import	java.util.HashMap
// --------------------------------------------------------------
object epub_update
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val file_epub=args(0)
	val id_in=args(1)
	val population_in=args(2).toInt

	println (id_in + "\t" +  population_in)

	var dict_aa = tika_manipulate.tika_parse (file_epub,"epub_update")


	var dict_bb = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

	text_manipulate.dict_display_proc (dict_aa)

	epub_manipulate.dict_to_epub_proc(file_epub,dict_aa)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
