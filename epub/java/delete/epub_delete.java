// --------------------------------------------------------------
//
//	epub_delete.java
//
//					Jan/07/2012
// --------------------------------------------------------------
import static java.lang.System.err;
import static java.lang.System.exit;

import java.io.IOException;
import org.xml.sax.SAXException;

import	java.util.HashMap;
// --------------------------------------------------------------
public class epub_delete
{

// --------------------------------------------------------------
public static void main (String args[])
	throws IOException, SAXException
{
	if (args.length < 1)
		{
		err.println("USAGE: epub_delete <resourceUrl>");
		exit(1);
		}

	System.out.println ("*** 開始 ***");

	String	epub_file = args[0];
	String	id = args[1];

	System.out.println ("\tid = " + id);

	try
		{
		HashMap <String, HashMap<String,String>> dict_aa
			= tika_manipulate.tika_parse (epub_file,"epub_delete");

		text_manipulate.dict_delete_proc (dict_aa,id);

		text_manipulate.dict_display_proc (dict_aa);


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
