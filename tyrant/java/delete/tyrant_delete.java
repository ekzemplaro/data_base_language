// --------------------------------------------------------------
//	tyrant_delete.java
//
//					Jun/22/2011
// --------------------------------------------------------------
import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;

import	net.arnx.jsonic.JSON;
 
// --------------------------------------------------------------
public class tyrant_delete
{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);
 
	String[] serverlist = { "localhost:1978" };
	SockIOPool pool = SockIOPool.getInstance();
	pool.setServers(serverlist);
	pool.initialize();

	MemCachedClient mc = new MemCachedClient();

	mc.delete(id);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
