// ------------------------------------------------------------------
//	mcachedb_create.cs
//
//					Jun/01/2014
//
// ------------------------------------------------------------------
using System;
using System.Collections;
using System.Collections.Generic;

using Memcached.ClientLibrary;

// ------------------------------------------------------------------
public static class mcachedb_create
{

// ------------------------------------------------------------------
public static void Main(string[] args) 
{
	Console.WriteLine  ("*** 開始 ***");

	String[] serverlist = { "127.0.0.1:21201" };

	SockIOPool pool = SockIOPool.GetInstance();
	pool.SetServers(serverlist);
	pool.Initialize();

	MemcachedClient mc = new MemcachedClient();

	mcached_write_proc (mc);

	pool.Shutdown();

	Console.WriteLine  ("*** 終了 ***");
}
// ------------------------------------------------------------------
static void mcached_write_proc (MemcachedClient mc)
{
	mcache_manipulate.data_put_proc (mc,"t1521","新潟",47185,"2009-3-18");
	mcache_manipulate.data_put_proc (mc,"t1522","長",39654,"2009-7-11");
	mcache_manipulate.data_put_proc (mc,"t1523","新発田",52173,"2009-7-11");
	mcache_manipulate.data_put_proc (mc,"t1524","上越",41892,"2009-3-17");
	mcache_manipulate.data_put_proc (mc,"t1525","糸魚川",73561,"2009-10-5");
	mcache_manipulate.data_put_proc (mc,"t1526","加茂",32745,"2009-9-14");
	mcache_manipulate.data_put_proc (mc,"t1527","三条",25968,"2009-7-17");
	mcache_manipulate.data_put_proc (mc,"t1528","佐渡",74521,"2009-1-26");
	mcache_manipulate.data_put_proc (mc,"t1529","柏崎",37816,"2009-7-19");
	mcache_manipulate.data_put_proc (mc,"t1530","村上",57294,"2009-9-2");
	mcache_manipulate.data_put_proc (mc,"t1531","十日町",76219,"2009-3-24");
	mcache_manipulate.data_put_proc (mc,"t1532","五泉",19237,"2009-8-17");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
