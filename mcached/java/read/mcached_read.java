// --------------------------------------------------------------
//	read/mcached_read.java
//
//					Jan/07/2014
// --------------------------------------------------------------
import	java.util.HashMap;
import	java.net.Socket;
import	java.io.DataOutputStream;
import	java.io.DataInputStream;
import	net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class mcached_read
{
 
// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String server = "localhost";
	int servPort = 11211;

	String [] keys = {"t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"};

	Socket sock = new Socket (server,servPort);

	DataOutputStream output = new DataOutputStream (sock.getOutputStream ());

	DataInputStream rr = new DataInputStream (sock.getInputStream ());

	for (String key : keys)
		{
		String str_json = mcached_socket.socket_read_proc (key,rr,output);

		if (str_json != null)
			{
			if (2 < str_json.length ())
				{
				json_parser (key,str_json);
				}
			}
		}

	rr.close ();
	output.close ();
	sock.close ();

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
static void json_parser (String key,String str_json)
{
	HashMap <String,Object>  unit_aa
			= (HashMap <String,Object>)JSON.decode (str_json);
        String name = unit_aa.get ("name").toString ();
	int population = Integer.parseInt (unit_aa.get ("population").toString ());
        String date_mod = unit_aa.get ("date_mod").toString ();

//	System.out.print (key + "\t");
	System.out.print (name + "\t");
	System.out.print (population + "\t");
	System.out.print (date_mod + "\n");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
