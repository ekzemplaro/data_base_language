// --------------------------------------------------------------
//
//	epub_read.java
//
//					Jan/07/2012
// --------------------------------------------------------------
import static java.lang.System.err;
import static java.lang.System.exit;

import java.io.IOException;
import org.xml.sax.SAXException;

import	java.util.HashMap;
// --------------------------------------------------------------
public class epub_read
{

// --------------------------------------------------------------
public static void main (String args[])
	throws IOException, SAXException
{
	if (args.length < 1)
		{
		err.println("USAGE: epub_read <resourceUrl>");
		exit(1);
		}

	System.out.println ("*** 開始 ***");

	try
		{
		HashMap <String, HashMap<String,String>> dict_aa
			= tika_manipulate.tika_parse (args[0],"epub_read");

		text_manipulate.dict_display_proc (dict_aa);
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
