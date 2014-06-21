// --------------------------------------------------------------
//	webdav_read.java
//
//					Mar/18/2013
// --------------------------------------------------------------
import	java.util.HashMap;
import  net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class webdav_read
{

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	final String uri= "http://cddn007:3004/city/tokyo.json";

	String str_json = get_uri.get_uri_proc (uri);
//	System.out.println (str_json);

	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (str_json);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
