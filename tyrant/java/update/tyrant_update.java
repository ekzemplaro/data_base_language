// --------------------------------------------------------------
//	tyrant_update.java
//
//					Feb/04/2015
// --------------------------------------------------------------
import java.util.HashMap;

 
// --------------------------------------------------------------
public class tyrant_update
{
 
// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key_in = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey_in = " + key_in);
	System.out.println ("\tpopulation = " + population);

	final String server = "host_ubuntu1";
	final int port = 1978;

	mcached_socket.mcached_update_proc (server,port,key_in,population);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
