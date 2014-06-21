// --------------------------------------------------------------
//
//	tika_manipulate.java
//
//					Jan/07/2012
// --------------------------------------------------------------
import static java.lang.System.err;
import static java.lang.System.exit;
import static java.lang.System.out;
import java.lang.Class;

import java.io.IOException;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.File;

import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.parser.Parser;
import org.apache.tika.Tika;
import org.apache.tika.sax.BodyContentHandler;

import org.xml.sax.SAXException;

import	java.util.HashMap;
// --------------------------------------------------------------
public class tika_manipulate
{

// --------------------------------------------------------------
public static HashMap <String, HashMap<String,String>>
	tika_parse (String resourceLocation,String class_name)
	throws IOException,SAXException
{
	System.out.println (resourceLocation);

	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

        try {
		System.out.println (resourceLocation);
		File ff = new File (resourceLocation);
		Class cc = null;
		try {
		cc = Class.forName (class_name);
		} catch (Exception ex) {
                // This should not happen.
            }
       
	InputStream input = cc.getResourceAsStream (resourceLocation);
	Metadata metadata = new Metadata ();
   
	BodyContentHandler handler = new BodyContentHandler ();
	AutoDetectParser parser = new AutoDetectParser ();

	parser.parse (input, handler, metadata);
   
	String content = new Tika().parseToString(ff);

	dict_aa = content_parser (content);

//	text_manipulate.dict_display_proc (dict_aa);
	}
	catch (Exception e) {
		e.printStackTrace();
	}

	return	dict_aa;
}

// --------------------------------------------------------------
public static HashMap <String, HashMap<String,String>> content_parser
	(String content)
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	String [] lines = content.split ("[\n]",-1);

/*
	System.out.println (lines.length);
	System.out.println (lines[0].length ());
*/

	for (int it=0; it< lines.length; it++)
		{
		if (0 < lines[it].length ())
			{
			HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

			String [] cols = lines[it].split ("[, \t]",-1);

			if (3 < cols.length)
				{
			dict_unit.put ("name",cols[1]);
			dict_unit.put ("population",cols[2]);
			dict_unit.put ("date_mod",cols[3]);
			dict_aa.put (cols[0],dict_unit);
				}
			else
				{
			System.out.println (cols.length);
			System.out.println (lines[it]);
				}
/*
			System.out.println (cols[0]);
			System.out.println (lines[it]);
*/
			}
		}
 
//	System.out.print (content); 

	return	dict_aa;
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
