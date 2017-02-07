// --------------------------------------------------------------
//
//	pdf_read.java
//
//					Jan/07/2012
// --------------------------------------------------------------
import static java.lang.System.err;
import static java.lang.System.exit;

import java.io.IOException;
import org.xml.sax.SAXException;

import	java.util.HashMap;
// --------------------------------------------------------------
public class pdf_read
{

// --------------------------------------------------------------
public static void main (String args[])
	throws IOException, SAXException
{
	if (args.length < 1)
		{
		err.println("USAGE: pdf_read <resourceUrl>");
		exit(1);
		}

	System.out.println ("*** 開始 ***");

	try
		{
		HashMap <String, HashMap<String,String>> dict_aa
			= tika_manipulate.tika_parse (args[0],"pdf_read");

		text_manipulate.dict_display_proc (dict_aa);
		}
	catch (Throwable tt)
		{
		err.println ("Could not parse document:"
		+ tt.getClass() + ":" + tt.getMessage());
		tt.printStackTrace (err);
		}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
