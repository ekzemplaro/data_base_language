// --------------------------------------------------------------
//	webdav_delete.java
//
//					Jan/26/2012
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class webdav_delete
{

// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key_in = args[0];

	System.out.println ("\tkey_in = " + key_in);

	String uri= "http://cddn007:3004/city/tokyo.json";

	String str_json = get_uri.get_uri_proc (uri);

	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (str_json);

	if (dict_aa.containsKey (key_in))
		{
		text_manipulate.dict_delete_proc (dict_aa,key_in);

		text_manipulate.dict_display_proc (dict_aa);

		str_json = json_manipulate.dict_to_json_proc (dict_aa);

		get_uri.rest_put_proc (uri,str_json,"text/json");
	}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
