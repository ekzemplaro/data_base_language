// --------------------------------------------------------------
//
//	Mcachedb_read.hx
//
//						Feb/25/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Mcachedb_read
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");


	var keys = ["t1521","t1522","t1523","t1524","t1525",
		"t1526","t1527","t1528","t1529",
		"t1530","t1531","t1532"];


	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("localhost"),21201);

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
