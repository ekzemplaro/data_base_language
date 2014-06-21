// --------------------------------------------------------------
//
//	Mcached_manipulate.hx
//
//						Feb/25/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Mcached_manipulate
{
// --------------------------------------------------------------
public static function mcached_socket_read_proc (ss,key_in:String) : String
{
	var json_str = "";

	var command = "get " + key_in + "\r\n";
	ss.write (command);

	var line = ss.input.readLine();
//	Sys.println (line);

	if (line != "END")
		{
		json_str = ss.input.readLine();
//		Sys.println (json_str);
	var line = ss.input.readLine();
//	Sys.println (line);
		}

	return	json_str;
}

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
public static function mcached_delete_proc (ss,key:String)
{
	var command = "delete " + key + "\r\n";
	ss.write (command);

	var line = ss.input.readLine();
	Sys.println (line);
}

// --------------------------------------------------------------
public static function mcached_update_proc (ss,key:String ,population_in:Int)
{
	var json_str = Mcached_manipulate.mcached_socket_read_proc (ss,key);

	if (1 < json_str.length)
		{
		var unit_aa = Json.parse (json_str);

		unit_aa.population = population_in;
		unit_aa.date_mod = Date.now().toString ();

		var json_str_new = Json.stringify (unit_aa);

		Sys.println (json_str_new);

		mcached_socket_write_proc (ss,key,json_str_new);
		}
}

// --------------------------------------------------------------
public static function mcached_socket_write_proc
	(ss,key: String,json_str: String)
{
	var llx: Int = json_str.length;

//	Sys.println (llx);

	var command: String = "set " + key + " 0 0 " + Std.string (llx) + "\r\n";

//	Sys.println (command);

	ss.write (command);
	ss.write (json_str);
	ss.write ("\r\n");

	var line = ss.input.readLine();
//	Sys.println (line);
}

// --------------------------------------------------------------
public static function dict_to_mcached_proc
	(ss,dict_aa: Map <String,Map<String,String>>)
{
	for (key in dict_aa.keys ())
		{
		var unit_aa = dict_aa.get (key);
		var json_str = Json.stringify (unit_aa);
//        	Sys.println (json_str);

		mcached_socket_write_proc (ss,key,json_str);
		}

}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
