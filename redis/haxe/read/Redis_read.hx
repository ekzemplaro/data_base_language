// --------------------------------------------------------------
//
//	Redis_read.hx
//
//						Feb/25/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Redis_read
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var keys = ["t1851","t1852","t1853","t1854","t1855",
		"t1856","t1857","t1858","t1859"];

	var port:Int = 6379;
	var hostname:String = "host_dbase";
	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host(hostname),port);

	for (key in keys)
		{
		var json_str = Redis_manipulate.redis_socket_read_proc (ss,key);

		if (1 < json_str.length)
			{
			Mcached_manipulate.json_parser (key,json_str);
			}
		}

	ss.close ();

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
