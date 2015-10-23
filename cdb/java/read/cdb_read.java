// ----------------------------------------------------------------
/*
	cdb_read.java

					May/29/2013

*/
// ----------------------------------------------------------------
import java.io.IOException;
import java.util.HashMap;

// ----------------------------------------------------------------
public class cdb_read
{
// ----------------------------------------------------------------
public static void main(String[] args) throws IOException
{
	System.out.println ("*** 開始 ***");

	String file_cdb = args[0];

	HashMap <String, HashMap<String,String>> dict_aa
		= cdb_manipulate.cdb_to_dict_proc (file_cdb);

	text_manipulate.dict_display_proc (dict_aa);
		
	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
