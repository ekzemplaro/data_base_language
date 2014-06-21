// ----------------------------------------------------------------
/*
	cdb_delete.java

					May/29/2013

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
	String	key = args[1];


	HashMap <String, HashMap<String,String>> dict_aa
		= cdb_manipulate.cdb_to_dict_proc (file_cdb);

	text_manipulate.dict_delete_proc (dict_aa,key);

	text_manipulate.dict_display_proc (dict_aa);

	cdb_manipulate.dict_to_cdb_proc (dict_aa,file_cdb);

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------
}

// ----------------------------------------------------------------
