// --------------------------------------------------------------
//	tyrant_read.java
//
//					Sep/14/2015
// --------------------------------------------------------------
import java.util.HashMap;

// --------------------------------------------------------------
public class tyrant_read
{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");
 
	final String server = "host_ubuntu";
	final int port = 1978;
	System.out.print (server + "\t");
	System.out.println (port);


	String [] keys = {"t4761","t4762","t4763","t4764","t4765",
		"t4766","t4767","t4768","t4769"};

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
 
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
