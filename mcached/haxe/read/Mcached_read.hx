// --------------------------------------------------------------
//
//	Mcached_read.hx
//
//						Feb/25/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Mcached_read
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var keys = ["t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"];

	var port:Int = 11211;
	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("localhost"),port);

	for (key in keys)
		{
		var json_str = Mcached_manipulate.mcached_socket_read_proc (ss,key);

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
