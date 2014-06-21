// --------------------------------------------------------------
/*
	basex_read.java

				Oct/27/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class basex_read {
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String url_in = "http://admin:admin@localhost:8984/rest/cities?query=/";

	String str_xml = get_uri.get_uri_proc (url_in);

//	System.out.println (str_xml);


	HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
