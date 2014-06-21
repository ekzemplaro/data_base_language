// --------------------------------------------------------------
//
//	Json_manipulate.hx
//
//						Feb/26/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Jaon_manipulate
{
// --------------------------------------------------------------
public static function json_parser (key:String,json_str:String)
{
	var unit_aa = Json.parse (json_str);

	Sys.print (key + "\t");
	Sys.print (unit_aa.name + "\t");
	Sys.print (unit_aa.population + "\t");
	Sys.println (unit_aa.date_mod);
}

// --------------------------------------------------------------
public static function json_update_proc (json_str:String ,population_in:Int)
{
	if (1 < json_str.length)
		{
		var unit_aa = Json.parse (json_str);

		unit_aa.population = population_in;
		unit_aa.date_mod = Date.now().toString ();

		json_str = Json.stringify (unit_aa);

		}

	return	json_str;
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
