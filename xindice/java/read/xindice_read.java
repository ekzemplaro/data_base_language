// --------------------------------------------------------------
/*
	java/xindice_read.java

				May/11/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class xindice_read {
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** xindice_read ***");

	String server_db = "http://host_dbase:8888/xindice/db/";
	String collections = "cities";
	String url_sub = "cities";
	String url_in = server_db + collections + '/' + url_sub;

	String str_xml = get_uri.get_uri_proc (url_in);

	HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println("***** end *****");
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
