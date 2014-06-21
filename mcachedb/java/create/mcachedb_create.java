// --------------------------------------------------------------
//	create/mcachedb_create.java
//
//					Jun/27/2011
// --------------------------------------------------------------
import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;
 
// --------------------------------------------------------------
public class mcachedb_create{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");
 
                // SockIOPool を初期化
	String[] serverlist = { "localhost:21201" };
	SockIOPool pool = SockIOPool.getInstance();
	pool.setServers(serverlist);
	pool.initialize();

	mcachedb_write_proc ();

	MemCachedClient mc = new MemCachedClient();

	String [] keys = {"t1521","t1522","t1523","t1524","t1525","t1526",
		"t1527","t1528","t1529","t1530","t1531","t1532"};

	for (String key : keys)
		{
		mcached_manipulate.mcached_read_single (mc,key);
		}

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
static void mcachedb_write_proc ()
{
	MemCachedClient mc = new MemCachedClient();
	mcached_manipulate.data_put_proc (mc,"t1521","新潟",72185,"2008-5-14");
	mcached_manipulate.data_put_proc (mc,"t1522","長岡",63574,"2008-7-21");
	mcached_manipulate.data_put_proc (mc,"t1523","新発田",21593,"2008-9-12");
	mcached_manipulate.data_put_proc (mc,"t1524","上越",71462,"2008-10-15");
	mcached_manipulate.data_put_proc (mc,"t1525","糸魚川",32485,"2008-9-14");
	mcached_manipulate.data_put_proc (mc,"t1526","加茂",26354,"2008-7-17");
	mcached_manipulate.data_put_proc (mc,"t1527","三条",28751,"2008-1-26");
	mcached_manipulate.data_put_proc (mc,"t1528","佐渡",36192,"2008-4-12");
	mcached_manipulate.data_put_proc (mc,"t1529","柏崎",75819,"2008-9-15");
	mcached_manipulate.data_put_proc (mc,"t1530","村上",67582,"2008-6-22");
	mcached_manipulate.data_put_proc (mc,"t1531","十日町",54618,"2008-7-25");
	mcached_manipulate.data_put_proc (mc,"t1532","五泉",82356,"2008-8-24");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
