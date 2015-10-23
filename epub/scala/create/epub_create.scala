// ----------------------------------------------------------
/*
	epub_create.scala

						Sep/14/2014
*/
// ----------------------------------------------------------
import java.io.FileOutputStream

import com.adobe.dp.epub.io.OCFContainerWriter
import com.adobe.dp.epub.ncx.TOCEntry
import com.adobe.dp.epub.opf.NCXResource
import com.adobe.dp.epub.opf.OPSResource
import com.adobe.dp.epub.ops.Element
import com.adobe.dp.epub.ops.OPSDocument
import com.adobe.dp.epub.opf.Publication

import scala.collection.mutable

// ----------------------------------------------------------
object epub_create
{

// ----------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val epub_file = args(0)

	val dict_aa = data_prepare_proc ()

	dict_to_epub_proc (epub_file,dict_aa)

	println	("*** 終了 ***")
}

// ----------------------------------------------------------
def dict_to_epub_proc (epub_file: String,dict_aa: mutable.Map[String,Object])
{
	val epub = new Publication()

	epub.addDCMetadata("title", "My First EPUB")
	epub.addDCMetadata("creator", System.getProperty("user.name"))
	epub.addDCMetadata("language", "ja")

	val toc = epub.getTOC()
	val rootTOCEntry = toc.getRootTOCEntry()

	val main = epub.createOPSResource("OPS/main.html")
	epub.addToSpine(main)

	val mainDoc = main.getDocument()

	val mainTOCEntry = toc.createTOCEntry("Intro", mainDoc.getRootXRef())
	rootTOCEntry.add(mainTOCEntry)

	val body = mainDoc.getBody()

	for (pair <- dict_aa)
		{
		val paragraph_bb = mainDoc.createElement("p")
		var unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]
		val key = pair._1
		val dict_unit = dict_aa.get (key)
		val name = unit_aa ("name")
		val str_population = unit_aa ("population")
		val population = Integer.parseInt (str_population)
		val date_mod = unit_aa ("date_mod")
		paragraph_bb.add (key)
		paragraph_bb.add (" ")
		paragraph_bb.add (name)
		paragraph_bb.add (" ")
		paragraph_bb.add (str_population)
		paragraph_bb.add (" ")
		paragraph_bb.add (date_mod)
		body.add (paragraph_bb)
		}

		val writer = new OCFContainerWriter (new FileOutputStream (epub_file))
		epub.serialize(writer)
}
// ----------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {
	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1931","甲府",51276,"1998-2-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1932","富士吉田",39142,"1998-4-23")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1933","都留",27853,"1998-5-24")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1934","山梨",89624,"1998-9-14")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1935","大月",72531,"1998-8-12")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1936","韮崎",68529,"1998-7-28")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1937","南アルプス",39451,"1998-6-19")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1938","北杜",47362,"1998-11-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1939","甲斐",46872,"1998-10-24")

	return	dict_aa
}

// ----------------------------------------------------------
}
// ----------------------------------------------------------
