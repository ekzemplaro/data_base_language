// --------------------------------------------------------------
//	read/mcachedb_update.java
//
//					Feb/02/2015
// --------------------------------------------------------------
import java.util.HashMap;

// --------------------------------------------------------------
public class mcachedb_update
{
 
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	final String server = "host_ubuntu";
	final int port = 21201;

	mcached_socket.mcached_update_proc (server,port,key,population);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
