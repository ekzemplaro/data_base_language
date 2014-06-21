// ------------------------------------------------------------------
//	tyrant_read.cs
//
//					Jun/23/2011
//
// ------------------------------------------------------------------
using System;
using System.Collections;
using System.Collections.Generic;

using Memcached.ClientLibrary;

// ------------------------------------------------------------------
public static class mcached_read
{

// ------------------------------------------------------------------
public static void Main(string[] args) 
{
	Console.WriteLine  ("*** 開始 ***");

	String[] serverlist = { "127.0.0.1:1978" };

	SockIOPool pool = SockIOPool.GetInstance();
	pool.SetServers(serverlist);
	pool.Initialize();

	MemcachedClient mc = new MemcachedClient();

	List <String> keys = new List <String> ()
		{"t4761","t4762","t4763","t4764","t4765",
		"t4766","t4767","t4768","t4769"};

	foreach (String key in keys)
		{
		if (mc.KeyExists (key))
			{
			string json_str = (string)mc.Get(key);

			if (json_str != null)
				{
			kvalue_manipulate.out_record_proc (key,json_str);
				}
			}
		}

	pool.Shutdown();

	Console.WriteLine  ("*** 終了 ***");
}


// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
