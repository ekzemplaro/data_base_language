// --------------------------------------------------------------
//	delete/mcachedb_delete.java
//
//					Jun/08/2011
// --------------------------------------------------------------
import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;

// --------------------------------------------------------------
public class mcachedb_delete
{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);
 
                // SockIOPool を初期化
	String[] serverlist = { "localhost:21201" };
	SockIOPool pool = SockIOPool.getInstance();
	pool.setServers(serverlist);
	pool.initialize();

	MemCachedClient mc = new MemCachedClient();

	mc.delete (id);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
