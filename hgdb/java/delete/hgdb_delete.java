// -------------------------------------------------------------- 
//
//	hgdb_delete.java
//
//						Feb/01/2012
//
// --------------------------------------------------------------
import	java.util.HashMap;
// --------------------------------------------------------------
public class hgdb_delete
{

// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String databaseLocation = args[0];

	String	key_in = args[1];
	System.out.println ("\tkey_in = " + key_in);

	HashMap <String, HashMap<String,String>> dict_aa
		= hgdb_manipulate.hgdb_to_dict_proc (databaseLocation);

	if (dict_aa.containsKey (key_in))
		{
		text_manipulate.dict_delete_proc (dict_aa,key_in);

		text_manipulate.dict_display_proc (dict_aa);

		hgdb_manipulate.dict_to_hgdb_proc (dict_aa,databaseLocation);
		}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
