// --------------------------------------------------------------
//	read/mcached_read.java
//
//					Feb/02/2015
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class mcached_read
{
 
// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	final String server = "localhost";
	final int port = 11211;

	String [] keys = {"t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"};

	HashMap <String, HashMap<String,String>> dict_aa =
			mcached_socket.mcached_to_dict_proc (server,port,keys);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
