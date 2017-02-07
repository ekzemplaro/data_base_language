// ----------------------------------------------------------------
/*
	cdb_delete.java

					Jun/12/2015

*/
// ----------------------------------------------------------------
import	java.io.IOException;
import	java.util.HashMap;

// ----------------------------------------------------------------
public class cdb_delete
{
// ----------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	file_cdb = args[0];
	String	key_in = args[1];

	System.out.println ("\tkey_in = " + key_in);

	HashMap <String, HashMap<String,String>> dict_aa
		= cdb_manipulate.cdb_to_dict_proc (file_cdb);

	text_manipulate.dict_delete_proc (dict_aa,key_in);

//	text_manipulate.dict_display_proc (dict_aa);

	cdb_manipulate.dict_to_cdb_proc (dict_aa,file_cdb);

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------
}

// ----------------------------------------------------------------
