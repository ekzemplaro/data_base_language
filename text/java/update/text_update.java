// -----------------------------------------------------------------------
/*
	text_update.java

					Feb/02/2012
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;

// -----------------------------------------------------------------------
public class text_update
{

// -----------------------------------------------------------------------
public	static void main (String [] args)
{
	System.out.println ("*** 開始 *** update ***");

	String text_file = args[0];

	String	key = args[1];
	int	population = Integer.parseInt (args[2]);
	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	HashMap <String, HashMap<String,String>> dict_aa
		= text_manipulate.text_read_proc (text_file);

	text_manipulate.dict_update_proc (dict_aa,key,population);

	text_manipulate.dict_display_proc (dict_aa);

	text_manipulate.text_write_proc (text_file,dict_aa);

	System.out.println ("*** 終了 ***");
}

// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------

