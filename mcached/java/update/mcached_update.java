// --------------------------------------------------------------
//	mcached_update.java
//
//					Feb/04/2015
// --------------------------------------------------------------
import	java.util.HashMap;

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

	final String server = "localhost";
	final int port = 11211;

	mcached_socket.mcached_update_proc (server,port,key,population);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
