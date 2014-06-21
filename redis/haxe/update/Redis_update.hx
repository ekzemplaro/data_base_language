// --------------------------------------------------------------
//
//	Redis_update.hx
//
//						Feb/25/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Redis_update
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var key = Sys.args ()[0];
	var population = Std.parseInt (Sys.args ()[1]);

	Sys.println (key);
	Sys.println (population);

	var port:Int = 6379;
	var hostname:String = "host_dbase";
	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host(hostname),port);

	Redis_manipulate.redis_update_proc (ss,key,population);

	ss.close ();

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
