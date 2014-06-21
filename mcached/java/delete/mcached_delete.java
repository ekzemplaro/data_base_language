// --------------------------------------------------------------
//	delete/mcached_delete.java
//
//					Jan/07/2014
// --------------------------------------------------------------
import	java.net.Socket;
import	java.io.DataOutputStream;
import	java.io.DataInputStream;
// --------------------------------------------------------------
public class mcached_delete
{
 
// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	System.out.println ("\tkey = " + key);

	String server = "localhost";
	int servPort = 11211;

	Socket sock = new Socket (server,servPort);

	DataOutputStream output = new DataOutputStream (sock.getOutputStream ());

	DataInputStream rr = new DataInputStream (sock.getInputStream ());

	mcached_socket.socket_delete_record_proc (key,rr,output);

	rr.close ();
	output.close ();
	sock.close ();
 
	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
