// -----------------------------------------------------------------------
/*
	elastic_read.java

				Oct/08/2018
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;

// -----------------------------------------------------------------------
public class elastic_read
{

// -----------------------------------------------------------------------
public	static void main (String [] args)
{
	System.err.println ("*** 開始 ***");

	String url = "http://localhost:9200/cities/tochigi/_search?q=*&size=100";

	String str_json = get_uri.get_uri_proc (url);

/*
	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (str_json);

	text_manipulate.dict_display_proc (dict_aa);
*/

	System.err.println ("*** 終了 ***");
}


// -----------------------------------------------------------------------
}

// -----------------------------------------------------------------------
