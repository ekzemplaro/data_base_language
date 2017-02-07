// --------------------------------------------------------------
//
//	pdf_update.java
//
//					Jan/07/2012
// --------------------------------------------------------------
import static java.lang.System.err;
import static java.lang.System.exit;

import java.io.IOException;
import org.xml.sax.SAXException;

import	java.util.HashMap;
// --------------------------------------------------------------
public class pdf_update
{

// --------------------------------------------------------------
public static void main (String args[])
	throws IOException, SAXException
{
	if (args.length < 1)
		{
		err.println("USAGE: pdf_update <resourceUrl>");
		exit(1);
		}

	System.out.println ("*** 開始 ***");

	String	pdf_file = args[0];
	String	id = args[1];
	int	population = Integer.parseInt (args[2]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

	try
		{
		HashMap <String, HashMap<String,String>> dict_aa
			= tika_manipulate.tika_parse (pdf_file,"pdf_update");

		text_manipulate.dict_update_proc (dict_aa,id,population);

		text_manipulate.dict_display_proc (dict_aa);

		pdf_manipulate.dict_to_pdf_proc (dict_aa,pdf_file);
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
