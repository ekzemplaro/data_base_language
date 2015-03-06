// ------------------------------------------------------------------
//	tyrant_create.cs
//
//					Feb/17/2015
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

	String[] serverlist = { "host_ubuntu1:1978" };

	SockIOPool pool = SockIOPool.GetInstance();
	pool.SetServers(serverlist);
	pool.Initialize();

	MemcachedClient mc = new MemcachedClient();

	mcached_write_proc (mc);

	List <String> keys = new List <String> ()
		{"t4761","t4762","t4763","t4764","t4765",
		"t4766","t4767","t4768","t4769"};

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
	mcache_manipulate.data_put_proc (mc,"t4761","那覇",21456,"2009-8-15");
	mcache_manipulate.data_put_proc (mc,"t4762","宜野湾",67281,"2009-3-24");
	mcache_manipulate.data_put_proc (mc,"t4763","石垣",59714,"2009-3-17");
	mcache_manipulate.data_put_proc (mc,"t4764","浦添",71467,"2009-10-5");
	mcache_manipulate.data_put_proc (mc,"t4765","名護",34852,"2009-9-14");
	mcache_manipulate.data_put_proc (mc,"t4766","糸満",85694,"2009-7-17");
	mcache_manipulate.data_put_proc (mc,"t4767","沖縄",14258,"2009-1-26");
	mcache_manipulate.data_put_proc (mc,"t4768","豊見城",31284,"2009-5-21");
	mcache_manipulate.data_put_proc (mc,"t4769","うるま",42897,"2009-7-19");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
