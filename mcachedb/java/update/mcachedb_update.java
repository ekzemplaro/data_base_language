// --------------------------------------------------------------
//	read/mcachedb_update.java
//
//					Jun/08/2011
// --------------------------------------------------------------
import java.util.HashMap;
import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;

// --------------------------------------------------------------
public class mcachedb_update
{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);
 
                // SockIOPool を初期化
String[] serverlist = { "localhost:21201" };
SockIOPool pool = SockIOPool.getInstance();
pool.setServers(serverlist);
pool.initialize();

MemCachedClient mc = new MemCachedClient();
mcached_manipulate.mcached_update_proc (mc,id,population);

String [] keys = {"t1521","t1522","t1523","t1524","t1525","t1526",
		"t1527","t1528","t1529","t1530","t1531","t1532"};

	for (String key : keys)
		{
		mcached_manipulate.mcached_read_single (mc,key);
		}

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
