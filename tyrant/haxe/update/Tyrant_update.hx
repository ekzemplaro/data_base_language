// --------------------------------------------------------------
//
//	Tyrant_update.hx
//
//					Jan/13/2016
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Tyrant_update
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var key = Sys.args ()[0];
	var population = Std.parseInt (Sys.args ()[1]);

	Sys.println (key);
	Sys.println (population);

	var port:Int = 1978;
	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("host_ubuntu"),port);

	Mcached_manipulate.mcached_update_proc (ss,key,population);

	ss.close ();

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
