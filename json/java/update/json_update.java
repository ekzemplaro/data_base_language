// -----------------------------------------------------------------------
/*
	json_update.java

				Jan/26/2012
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;

// -----------------------------------------------------------------------
public class json_update
{

// -----------------------------------------------------------------------
public	static void main (String [] args)
{
	System.out.println ("*** 開始 ***");

	String json_file = args[0];
	String str_json = file_io.file_to_str_proc (json_file);

	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (str_json);

	String	key_in = args[1];
	int	population = Integer.parseInt (args[2]);
	System.out.print ("\tkey_in = " + key_in);
	System.out.println ("\tpopulation = " + population);

	text_manipulate.dict_update_proc (dict_aa,key_in,population);

	System.out.println ();

	text_manipulate.dict_display_proc (dict_aa);

	str_json = json_manipulate.dict_to_json_proc (dict_aa);

	file_io.file_write_proc (json_file,str_json);

	System.out.println ("*** 終了 ***");
}

// -----------------------------------------------------------------------
}

// -----------------------------------------------------------------------
