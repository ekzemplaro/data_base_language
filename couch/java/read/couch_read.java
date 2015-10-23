// --------------------------------------------------------------
//	read/couch_read.java
//
//					May/06/2015
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class couch_read
{

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	final String url_collection = "http://localhost:5984/nagano";

	HashMap <String, HashMap <String,String>> dict_aa
		= couch_manipulate.couch_to_dict_proc (url_collection);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
