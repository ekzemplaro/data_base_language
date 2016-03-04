// --------------------------------------------------------------
//
//	Redis_delete.hx
//
//						Feb/11/2016
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Redis_delete
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var key: String = Sys.args ()[0];

	Sys.println (key);

	var port:Int = 6379;
	var hostname: String = "host_dbase";
	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host(hostname),port);

	Redis_manipulate.redis_delete_proc (ss,key);

	ss.close ();

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
