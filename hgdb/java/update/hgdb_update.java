// -------------------------------------------------------------- 
//
//	hgdb_update.java
//
//						Feb/01/2012
//
// --------------------------------------------------------------
import	java.util.HashMap;
// --------------------------------------------------------------
public class hgdb_update
{

// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String databaseLocation = args[0];

	String	key = args[1];
	int	population = Integer.parseInt (args[2]);
	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	HashMap <String, HashMap<String,String>> dict_aa
		= hgdb_manipulate.hgdb_to_dict_proc (databaseLocation);

	text_manipulate.dict_update_proc (dict_aa,key,population);

	text_manipulate.dict_display_proc (dict_aa);

	hgdb_manipulate.dict_to_hgdb_proc (dict_aa,databaseLocation);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
