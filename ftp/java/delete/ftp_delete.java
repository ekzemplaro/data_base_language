// --------------------------------------------------------------
/*
	ftp_delete.java
					Sep/03/2015

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class ftp_delete
{

// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key_in = args[0];
	System.out.println ("\tkey_in = " + key_in);

	String hostname = "host_dbase";
	String user = "scott";
	String passwd = "tiger";
	String path_file = "city/iwate.json";

	String json_str = ftp_manipulate.ftp_get_proc (hostname,user,passwd,path_file);

//	System.out.println (json_str);

	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (json_str);

	if (dict_aa.containsKey (key_in))
		{
		text_manipulate.dict_delete_proc (dict_aa,key_in);

		json_str = json_manipulate.dict_to_json_proc (dict_aa);

		ftp_manipulate.ftp_put_proc (hostname,user,passwd,path_file,json_str);
		}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
