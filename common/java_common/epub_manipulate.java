// ----------------------------------------------------------
/*
	epub_manipulate.java

						Jan/07/2012
*/
// ----------------------------------------------------------
import	java.util.HashMap;
import	java.util.Set;

import java.io.FileOutputStream;

import com.adobe.dp.epub.io.OCFContainerWriter;
import com.adobe.dp.epub.ncx.TOCEntry;
import com.adobe.dp.epub.opf.NCXResource;
import com.adobe.dp.epub.opf.OPSResource;
import com.adobe.dp.epub.opf.Publication;
import com.adobe.dp.epub.ops.Element;
import com.adobe.dp.epub.ops.OPSDocument;

// ----------------------------------------------------------
public class epub_manipulate
{

// ----------------------------------------------------------
public static void dict_to_epub_proc
	(String epub_file,HashMap <String, HashMap <String,String>> dict_aa)
{

	System.out.println ("dict_to_epub_proc *** aaa");
	try {

		Publication epub = new Publication ();

		dict_to_epub_proc_title (epub);

		NCXResource toc = epub.getTOC ();
		TOCEntry rootTOCEntry = toc.getRootTOCEntry();

		OPSResource main = epub.createOPSResource("OPS/main.html");
		epub.addToSpine(main);

		OPSDocument mainDoc = main.getDocument();

		TOCEntry mainTOCEntry
			= toc.createTOCEntry("Intro", mainDoc.getRootXRef());

		rootTOCEntry.add(mainTOCEntry);
		dict_to_epub_proc_s4 (dict_aa,mainDoc);

		OCFContainerWriter writer = new OCFContainerWriter(
				new FileOutputStream (epub_file));
		epub.serialize(writer);

                } catch (Exception e) {
                        e.printStackTrace();
	}

	System.out.println ("dict_to_epub_proc *** zzz");

}

// ----------------------------------------------------------
static void dict_to_epub_proc_title (Publication epub)
{
	epub.addDCMetadata ("title", "My First EPUB");
	epub.addDCMetadata ("creator", System.getProperty("user.name"));
	epub.addDCMetadata ("language", "ja");

}

// ----------------------------------------------------------
static void dict_to_epub_proc_s4
	(HashMap <String, HashMap <String,String>> dict_aa,
		OPSDocument mainDoc)
{
	Element body = mainDoc.getBody();
	Set set_aaa = dict_aa.keySet ();
	System.out.println (set_aaa);

	for (Object key_aa: set_aaa)
		{
		Element paragraph_bb = mainDoc.createElement("p");
		String key = (String)key_aa;
		HashMap <String,String> dict_unit = dict_aa.get (key_aa);
		String name = dict_unit.get ("name");
		String str_population = dict_unit.get ("population");
		int population = Integer.parseInt (str_population);
		String date_mod = dict_unit.get ("date_mod");
		paragraph_bb.add (key);
		paragraph_bb.add (" ");
		paragraph_bb.add (name);
		paragraph_bb.add (" ");
		paragraph_bb.add (str_population);
		paragraph_bb.add (" ");
		paragraph_bb.add (date_mod);
		body.add (paragraph_bb);
		}
}

// ----------------------------------------------------------
}
// ----------------------------------------------------------
