// --------------------------------------------------------------
//	delete/mcachedb_delete.java
//
//					Feb/04/2015
// --------------------------------------------------------------
public class mcachedb_delete
{
 
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	System.out.println ("\tkey = " + key);

	final String server = "host_ubuntu";
	final int port = 21201;

	mcached_socket.mcached_delete_proc (server,port,key);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
