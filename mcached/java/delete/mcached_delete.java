// --------------------------------------------------------------
//	delete/mcached_delete.java
//
//					Feb/04/2015
// --------------------------------------------------------------
public class mcached_delete
{
 
// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	System.out.println ("\tkey = " + key);

	final String server = "localhost";
	final int port = 11211;

	mcached_socket.mcached_delete_proc (server,port,key);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
