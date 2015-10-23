// --------------------------------------------------------------
//
//	Json_read.hx
//
//						Feb/24/2014
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Json_read
{
// --------------------------------------------------------------
public static function main()
{
	Sys.println ("*** 開始 ***");

	var json_file = Sys.args ()[0];

	var json_str = sys.io.File.getContent (json_file);	

	var cities = Json.parse(json_str);
//	var cities : Map <String,Map<String,String>> = Json.parse(json_str);
//	var cities : Map <String,Dynamic> = Json.parse(json_str);

/*
	for (key in cities)
		{
		Sys.println (key);
		}
*/
//	record_display_proc ("t0921",cities.get ("t0921"));
	record_display_proc ("t0921",cities.t0921);
	record_display_proc ("t0922",cities.t0922);
	record_display_proc ("t0923",cities.t0923);
	record_display_proc ("t0924",cities.t0924);
	record_display_proc ("t0925",cities.t0925);

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
static function record_display_proc (key,unit_aa)
{
	Sys.print (key + "\t");
	Sys.print (unit_aa.name + "\t");
	Sys.print (unit_aa.population + "\t");
	Sys.println (unit_aa.date_mod);
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
