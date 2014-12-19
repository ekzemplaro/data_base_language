// ----------------------------------------------------------
/*
	epub_manipulate.groovy

						Dec/02/2014
*/
// ----------------------------------------------------------
import	java.util.HashMap
import	java.util.Set

import java.io.FileOutputStream

import com.adobe.dp.epub.io.OCFContainerWriter
import com.adobe.dp.epub.ncx.TOCEntry
import com.adobe.dp.epub.opf.NCXResource
import com.adobe.dp.epub.opf.OPSResource
import com.adobe.dp.epub.opf.Publication
import com.adobe.dp.epub.ops.Element
import com.adobe.dp.epub.ops.OPSDocument

import	text_manipulate
// ----------------------------------------------------------
class epub_manipulate
{

// ----------------------------------------------------------
static void dict_to_epub_proc (epub_file,dict_aa)
{
	try {
		def epub = new Publication()

		epub.addDCMetadata("title", "My First EPUB")
		epub.addDCMetadata("creator", System.getProperty("user.name"))
		epub.addDCMetadata("language", "ja")

		def toc = epub.getTOC()
		def rootTOCEntry = toc.getRootTOCEntry()

		def main = epub.createOPSResource("OPS/main.html")
		epub.addToSpine(main)

		def mainDoc = main.getDocument()

		def mainTOCEntry = toc.createTOCEntry("Intro", mainDoc.getRootXRef())
		rootTOCEntry.add(mainTOCEntry)

		def body = mainDoc.getBody()

	def set_aaa = dict_aa.keySet ()
		println (set_aaa)

	for (Object key_aa: set_aaa)
		{
		def paragraph_bb = mainDoc.createElement("p")
		def key = (String)key_aa
		def dict_unit = dict_aa.get (key_aa)
		def name = dict_unit.get ("name")
		String str_population = dict_unit.get ("population")
		int population = Integer.parseInt (str_population)
		def date_mod = dict_unit.get ("date_mod")
		paragraph_bb.add (key)
		paragraph_bb.add (" ")
		paragraph_bb.add (name)
		paragraph_bb.add (" ")
		paragraph_bb.add (str_population)
		paragraph_bb.add (" ")
		paragraph_bb.add (date_mod)
		body.add (paragraph_bb)
		}

		OCFContainerWriter writer = new OCFContainerWriter(
				new FileOutputStream (epub_file))
		epub.serialize(writer)

                } catch (Exception e) {
                        e.printStackTrace()
	}
}

// ----------------------------------------------------------
}
// ----------------------------------------------------------
