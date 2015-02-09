// --------------------------------------------------------------
//	tyrant_delete.java
//
//					Feb/04/2015
// --------------------------------------------------------------
public class tyrant_delete
{
 
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	System.out.println ("\tid = " + key);

	final String server = "host_ubuntu1";
	final int port = 1978;

	mcached_socket.mcached_delete_proc (server,port,key); 

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
