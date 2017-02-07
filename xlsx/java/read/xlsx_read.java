// ----------------------------------------------------------------
/*
	xlsx_read.java
					Jul/30/2013

*/
// ----------------------------------------------------------------
import	java.io.IOException;
import	java.util.HashMap;

// ----------------------------------------------------------------
public class xlsx_read
{
// ----------------------------------------------------------------
public static void main(String[]args) throws IOException
{
	System.out.println ("*** 開始 ***");

	String xlsx_file = args[0];

	HashMap <String,HashMap <String,String>> dict_aa
		= xlsx_manipulate.xlsx_read_proc (xlsx_file);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
	System.exit(0);
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
