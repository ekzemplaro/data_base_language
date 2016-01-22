// --------------------------------------------------------------
//
//	Mcachedb_update.hx
//
//						Jan/12/2016
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Mcachedb_update
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var key = Sys.args ()[0];
	var population = Std.parseInt (Sys.args ()[1]);

	Sys.println (key);
	Sys.println (population);

	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("host_ubuntu"),21201);

	Mcached_manipulate.mcached_update_proc (ss,key,population);

	ss.close ();

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
