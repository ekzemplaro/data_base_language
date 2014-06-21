// --------------------------------------------------------------
//	mcached_update.java
//
//					Jan/07/2014
// --------------------------------------------------------------
import	java.util.HashMap;

import	java.net.Socket;
import	java.io.DataOutputStream;
import	java.io.DataInputStream;
import	net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class mcached_update
{
 
// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	String server = "localhost";
	int servPort = 11211;

	Socket sock = new Socket (server,servPort);

	DataOutputStream output = new DataOutputStream (sock.getOutputStream ());

	DataInputStream rr = new DataInputStream (sock.getInputStream ()); 

	String str_json = mcached_socket.socket_read_proc (key,rr,output);

	System.out.println (str_json);

	HashMap <String,Object>  unit_aa = (HashMap <String,Object>)JSON.decode (str_json);

	String name = unit_aa.get ("name").toString ();
	System.out.println (name);

	String date_mod = text_manipulate.get_current_date_proc ();

	String json_new = json_manipulate.unit_json_gen_proc
				(name,population,date_mod);
	System.out.println (json_new);
	mcached_socket.socket_write_proc (key,json_new,rr,output);

	rr.close ();
	output.close ();
	sock.close ();

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
