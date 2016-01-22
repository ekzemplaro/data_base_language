// --------------------------------------------------------------
//
//	Tyrant_read.hx
//
//						Jan/13/2016
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Tyrant_read
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var keys = ["t4761","t4762","t4763","t4764","t4765",
		"t4766","t4767","t4768","t4769"];

	var port:Int = 1978;

	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("host_ubuntu"),port);

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
