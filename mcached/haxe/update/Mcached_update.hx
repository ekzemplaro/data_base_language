// --------------------------------------------------------------
//
//	Mcached_update.hx
//
//						Feb/25/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Mcached_update
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var key = Sys.args ()[0];
	var population = Std.parseInt (Sys.args ()[1]);

	Sys.println (key);
	Sys.println (population);

	var port:Int = 11211;
	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("localhost"),port);

	Mcached_manipulate.mcached_update_proc (ss,key,population);

	ss.close ();

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
