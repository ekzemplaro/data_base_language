// ------------------------------------------------------------------
//	mcached_create.cs
//
//					Jun/01/2014
//
// ------------------------------------------------------------------
using System;
using System.Collections;
using System.Collections.Generic;

using Memcached.ClientLibrary;

// ------------------------------------------------------------------
public static class mcached_create
{

// ------------------------------------------------------------------
public static void Main(string[] args) 
{
	Console.WriteLine  ("*** 開始 ***");

//	String[] serverlist = { "localhost:11211" };
	String[] serverlist = { "127.0.0.1:11211" };
//	String[] serverlist = { "cdbd026:11211" };
//	String[] serverlist = { "172.20.128.169:11211" };

	SockIOPool pool = SockIOPool.GetInstance();
	pool.SetServers(serverlist);
	pool.Initialize();

	MemcachedClient mc = new MemcachedClient();

	mcached_write_proc (mc);

	List <String> keys = new List <String> ()
		{"t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"};

	foreach (String key in keys)
		{
		string ss = (string)mc.Get(key);
		Console.WriteLine (ss);
		}

	pool.Shutdown();

	Console.WriteLine  ("*** 終了 ***");
}
// ------------------------------------------------------------------
static void mcached_write_proc (MemcachedClient mc)
{
	mcache_manipulate.data_put_proc (mc,"t1731","金沢",71284,"2009-4-21");
	mcache_manipulate.data_put_proc (mc,"t1732","輪島",62573,"2009-7-14");
	mcache_manipulate.data_put_proc (mc,"t1733","小松",59718,"2009-3-17");
	mcache_manipulate.data_put_proc (mc,"t1734","七尾",71469,"2009-10-5");
	mcache_manipulate.data_put_proc (mc,"t1735","珠洲",12892,"2009-9-14");
	mcache_manipulate.data_put_proc (mc,"t1736","加賀",81654,"2009-7-17");
	mcache_manipulate.data_put_proc (mc,"t1737","羽咋",14258,"2009-1-26");
	mcache_manipulate.data_put_proc (mc,"t1738","かほく",39251,"2009-5-21");
	mcache_manipulate.data_put_proc (mc,"t1739","白山",49257,"2009-7-19");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
