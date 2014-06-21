// --------------------------------------------------------------
//
//	epub_update.groovy
//
//					Jan/09/2012
// --------------------------------------------------------------
import static java.lang.System.err
import static java.lang.System.exit

import java.io.IOException
import org.xml.sax.SAXException

import	java.util.HashMap
// --------------------------------------------------------------
class epub_update
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

	def file_epub=args[0]
	def id_in=args[1]
	def population_in=args[2]
	println (id_in + "\t" +  population_in)

	def tika = new tika_manipulate ()
	def dict_aa = tika.tika_parse (file_epub,"epub_update")

	def ff = new text_manipulate ()

	def dict_bb = ff.dict_update_proc (dict_aa,id_in,population_in)

	ff.dict_display_proc (dict_aa)

	def epub = new epub_manipulate ()

	epub.dict_to_epub_proc(file_epub,dict_aa)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
