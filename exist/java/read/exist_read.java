// -----------------------------------------------------------------
/*
	java/read/exist_read.java

				May/17/2011
*/
// -----------------------------------------------------------------
import	java.util.HashMap;
// -----------------------------------------------------------------
public class exist_read
{

// -----------------------------------------------------------------
public static void main (String args[] ) throws Exception
{
	final String uri = "http://localhost:8086/exist/rest/db";
	String collections = "cities";
	String xml_file = "cities.xml";

	System.out.println ("*** 開始 ***");

	String uri_aa = uri + "/" + collections + "/" + xml_file;
	System.out.println ("*** uri_aa = " + uri_aa);
	String str_xml = get_uri.get_uri_proc (uri_aa);

	HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
