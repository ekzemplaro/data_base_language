// --------------------------------------------------------------
//
//	epub_update.java
//
//					Jan/07/2012
// --------------------------------------------------------------
import static java.lang.System.err;
import static java.lang.System.exit;

import java.io.IOException;
import org.xml.sax.SAXException;

import	java.util.HashMap;
// --------------------------------------------------------------
public class epub_update
{

// --------------------------------------------------------------
public static void main (String args[])
	throws IOException, SAXException
{
	if (args.length < 1)
		{
		err.println("USAGE: epub_update <resourceUrl>");
		exit(1);
		}

	System.out.println ("*** 開始 ***");

	String	epub_file = args[0];
	String	id = args[1];
	int	population = Integer.parseInt (args[2]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

	try
		{
		HashMap <String, HashMap<String,String>> dict_aa
			= tika_manipulate.tika_parse (epub_file,"epub_update");

		text_manipulate.dict_update_proc (dict_aa,id,population);

		text_manipulate.dict_display_proc (dict_aa);

//		epub_file = "tmp001.epub";

	System.out.println ("*** check ppp ***");

		epub_manipulate.dict_to_epub_proc (epub_file,dict_aa);

	System.out.println ("*** check qqq ***");
		}
	catch (Throwable t)
		{
		err.println ("Could not parse document:"
		+ t.getClass() + ":" + t.getMessage());
		t.printStackTrace(err);
		}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
