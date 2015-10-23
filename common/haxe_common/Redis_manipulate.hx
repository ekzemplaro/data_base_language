// --------------------------------------------------------------
//
//	Redis_manipulate.hx
//
//						Feb/26/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Redis_manipulate
{
// --------------------------------------------------------------
public static function redis_socket_read_proc (ss,key_in:String) : String
{
	var json_str = "";

	var command = "get " + key_in + "\r\n";
	ss.write (command);

	var line = ss.input.readLine();

	if (line != "$-1")
		{
		json_str = ss.input.readLine();
		}

	return	json_str;
}

// --------------------------------------------------------------
public static function redis_update_proc (ss,key:String ,population_in:Int)
{
	var json_str = Redis_manipulate.redis_socket_read_proc (ss,key);

	if (1 < json_str.length)
		{
		var unit_aa = Json.parse (json_str);

		unit_aa.population = population_in;
		unit_aa.date_mod = Date.now().toString ();

		var json_str_new = Json.stringify (unit_aa);

		redis_socket_write_proc (ss,key,json_str_new);
		}
}

// --------------------------------------------------------------
public static function redis_socket_write_proc (ss,key: String,json_str: String)
{
	ss.write ("*3\r\n");
	ss.write ("$3\r\n");
	ss.write ("set\r\n");

	var ll_key: Int = key.length;
	var command: String = "$" + Std.string (ll_key) + "\r\n";
	ss.write (command);
	var command_bb: String = key + "\r\n";
	ss.write (command_bb);

	var llx: Int = json_str.length;
	var command_cc: String = "$" + Std.string (llx) + "\r\n";
	ss.write (command_cc);
	var command_dd: String = json_str + "\r\n";
	ss.write (command_dd);

	var line = ss.input.readLine();
	Sys.println (line);
}

// --------------------------------------------------------------
public static function redis_delete_proc (ss,key:String)
{
	var command = "del " + key + "\r\n";
	ss.write (command);

	var line = ss.input.readLine();
	Sys.println (line);
}

// --------------------------------------------------------------
public static function dict_to_redis_proc
	(ss,dict_aa: Map <String,Map<String,String>>)
{
	for (key in dict_aa.keys ())
		{
		var unit_aa = dict_aa.get (key);
		var json_str = Json.stringify (unit_aa);
//        	Sys.println (json_str);

		redis_socket_write_proc (ss,key,json_str);
		}

}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
