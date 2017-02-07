// -----------------------------------------------------------------------
/*
	csv_delete.java

					Jan/26/2012
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;

// -----------------------------------------------------------------------
public class csv_delete
{

// -----------------------------------------------------------------------
public	static void main (String [] args)
{
	System.out.println ("*** 開始 ***");

	String text_file = args[0];

	String	key_in = args[1];
	System.out.println ("\tkey_in = " + key_in);

	HashMap <String, HashMap<String,String>> dict_aa
		= text_manipulate.csv_read_proc (text_file);

	if (dict_aa.containsKey (key_in))
		{
		text_manipulate.dict_delete_proc (dict_aa,key_in);

		text_manipulate.dict_display_proc (dict_aa);

		text_manipulate.csv_write_proc (text_file,dict_aa);
		}

	System.out.println ("*** 終了 ***");
}

// -----------------------------------------------------------------------
}

// -----------------------------------------------------------------------
