// --------------------------------------------------------------
/*
	ftp_update.java
					Sep/03/2015

*/
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class ftp_update
{

// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tid = " + key);
	System.out.println ("\tpopulation = " + population);

	String hostname = "host_dbase";
	String user = "scott";
	String passwd = "tiger";
	String path_file = "city/iwate.json";

	String json_str = ftp_manipulate.ftp_get_proc (hostname,user,passwd,path_file);

//	System.out.println (json_str);

	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (json_str);

	text_manipulate.dict_update_proc (dict_aa,key,population);

	json_str = json_manipulate.dict_to_json_proc (dict_aa);

	ftp_manipulate.ftp_put_proc (hostname,user,passwd,path_file,json_str);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
