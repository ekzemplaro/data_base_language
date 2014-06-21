// --------------------------------------------------------------
//	read/mcachedb_read.java
//
//					May/28/2012
// --------------------------------------------------------------
import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;
import java.util.HashMap;

// --------------------------------------------------------------
public class mcachedb_read
{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");
 
                // SockIOPool を初期化
	String[] serverlist = { "localhost:21201"};
	SockIOPool pool = SockIOPool.getInstance();
	pool.setServers(serverlist);
	pool.initialize();

	MemCachedClient mc = new MemCachedClient();

	String [] keys = {"t1521","t1522","t1523","t1524","t1525","t1526",
		"t1527","t1528","t1529","t1530","t1531","t1532"};

	HashMap <String, HashMap<String,String>> dict_aa =
		mcached_manipulate.mcached_to_dict_proc (mc,keys);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
