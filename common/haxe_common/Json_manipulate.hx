// --------------------------------------------------------------
//
//	Json_manipulate.hx
//
//					Jan/12/2016
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Json_manipulate
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
public static function json_to_dict_proc (json_str:String)
	: Map <String,Map<String,String>>
{
	var cities = Json.parse(json_str);

	var dict_aa = new Map ();

	for(key in Reflect.fields(cities) )
	{
	var unit_aa = Reflect.field(cities, key);

	var population = Std.parseInt (unit_aa.population);
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,key,unit_aa.name,
		population,unit_aa.date_mod);
	}

	return	dict_aa;
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
