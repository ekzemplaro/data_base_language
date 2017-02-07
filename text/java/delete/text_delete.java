// -----------------------------------------------------------------------
/*
	text_delete.java

					Sep/05/2016
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;

// -----------------------------------------------------------------------
public class text_delete
{

// -----------------------------------------------------------------------
public	static void main (String [] args)
{
	System.err.println ("*** 開始 ***");

	String text_file = args[0];

	String	key_in = args[1];
	System.out.println ("\tkey_in = " + key_in);

	HashMap <String, HashMap<String,String>> dict_aa
		= text_manipulate.text_read_proc (text_file);

	if (dict_aa.containsKey (key_in))
		{
		text_manipulate.dict_delete_proc (dict_aa,key_in);

		text_manipulate.text_write_proc (text_file,dict_aa);
		}

	System.err.println ("*** 終了 ***");
}

// -----------------------------------------------------------------------
}

// -----------------------------------------------------------------------
