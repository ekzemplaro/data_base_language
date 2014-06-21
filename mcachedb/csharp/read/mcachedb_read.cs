// ------------------------------------------------------------------
//	mcachedb_read.cs
//
//					May/28/2012
//
// ------------------------------------------------------------------
using System;
using System.Collections;
using System.Collections.Generic;


using Memcached.ClientLibrary;
using Newtonsoft.Json;

// ------------------------------------------------------------------
public static class mcached_read
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

	List <String> keys = new List <String> ()
		{"t1521","t1522","t1523","t1524","t1525","t1526",
		"t1527","t1528","t1529","t1530","t1531","t1532"};

	Dictionary <String,Object> dict_aa
		= mcache_manipulate.mcache_to_dict_proc (mc,keys);

	text_manipulate.dict_display_proc (dict_aa);

	pool.Shutdown();

	Console.WriteLine  ("*** 終了 ***");
}


// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
