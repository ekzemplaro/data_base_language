// -----------------------------------------------------------------------
/*
	json_read.java

				Sep/05/2016
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;

// -----------------------------------------------------------------------
public class json_read
{

// -----------------------------------------------------------------------
public	static void main (String [] args)
{
	System.err.println ("*** 開始 ***");

	String file_in = args[0];

	String str_json = file_io.file_to_str_proc (file_in);

	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (str_json);

	text_manipulate.dict_display_proc (dict_aa);

	System.err.println ("*** 終了 ***");
}


// -----------------------------------------------------------------------
}

// -----------------------------------------------------------------------
