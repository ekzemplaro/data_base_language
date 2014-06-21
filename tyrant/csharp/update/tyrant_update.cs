// -------------------------------------------------------------
//
//	tyrant_update.cs
//
//						Jun/23/2011
// -------------------------------------------------------------
using System;

using Memcached.ClientLibrary;


// -------------------------------------------------------------
class mcached_update
{

// -------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	String	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.WriteLine (id_in + "\t" + population_in);

	String[] serverlist = { "127.0.0.1:1978" };

	SockIOPool pool = SockIOPool.GetInstance();
	pool.SetServers(serverlist);
	pool.Initialize();

	MemcachedClient mc = new MemcachedClient();

	mcache_manipulate.update_proc (mc,id_in,population_in);

	pool.Shutdown();

	Console.WriteLine ("*** 終了 ***");
}
// -------------------------------------------------------------
}
// -------------------------------------------------------------
