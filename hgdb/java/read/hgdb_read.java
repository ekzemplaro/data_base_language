// -------------------------------------------------------------- 
//
//	hgdb_read.java
//
//						Feb/01/2012
//
// --------------------------------------------------------------
import	java.util.HashMap;
// --------------------------------------------------------------
public class hgdb_read
{

// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String databaseLocation = args[0];

	HashMap <String, HashMap<String,String>> dict_aa
		= hgdb_manipulate.hgdb_to_dict_proc (databaseLocation);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
