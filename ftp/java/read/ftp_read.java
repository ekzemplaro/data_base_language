// --------------------------------------------------------------
/*
	ftp_read.java
					Aug/21/2011

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class ftp_read
{

// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String hostname = "host_dbase";
	String user = "scott";
	String passwd = "tiger";
	String path_file = "city/iwate.json";

	String json_str = ftp_manipulate.ftp_get_proc (hostname,user,passwd,path_file);

//	System.out.println (json_str);

	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (json_str);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
