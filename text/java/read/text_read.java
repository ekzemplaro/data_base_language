// ----------------------------------------------------------------
/*
	read/text_read.java

					Sep/05/2016

*/
// ----------------------------------------------------------------
import	java.util.HashMap;

// ----------------------------------------------------------------
public class text_read
{
// ----------------------------------------------------------------
public static void main (String[] args)
{
	System.err.println ("*** 開始 ***");

	String	fname_in = args[0];

	HashMap <String, HashMap<String,String>> dict_aa
		= text_manipulate.text_read_proc (fname_in);

	text_manipulate.dict_display_proc (dict_aa);

	System.err.println ("*** 終了 ***");
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
