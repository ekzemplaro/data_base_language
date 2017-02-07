// --------------------------------------------------------------
//	read/mcachedb_read.java
//
//					Feb/05/2015
// --------------------------------------------------------------
import java.util.HashMap;

// --------------------------------------------------------------
public class mcachedb_read
{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	final String server = "host_ubuntu";
	final int port = 21201;

	String [] keys = {"t1521","t1522","t1523","t1524","t1525","t1526",
		"t1527","t1528","t1529","t1530","t1531","t1532"};

	try
		{
		HashMap <String, HashMap<String,String>> dict_aa =
			mcached_socket.mcached_to_dict_proc (server,port,keys);

		text_manipulate.dict_display_proc (dict_aa);
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
