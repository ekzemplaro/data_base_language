// ------------------------------------------------------------------
//	mcached_read.cs
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

//	String[] serverlist = { "localhost:11211" };
	String[] serverlist = { "127.0.0.1:11211" };

	SockIOPool pool = SockIOPool.GetInstance();
	pool.SetServers(serverlist);
	pool.Initialize();

	MemcachedClient mc = new MemcachedClient();

	List <String> keys = new List <String> ()
		{"t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"};

	Dictionary <String,Object>  dict_aa
		= mcache_manipulate.mcache_to_dict_proc (mc,keys);

	text_manipulate.dict_display_proc (dict_aa);

	pool.Shutdown();

	Console.WriteLine  ("*** 終了 ***");
}


// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
