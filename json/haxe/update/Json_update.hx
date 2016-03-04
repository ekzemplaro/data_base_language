// --------------------------------------------------------------
//
//	Json_update.hx
//
//					Feb/11/2016
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Json_update
{
// --------------------------------------------------------------
public static function main()
{
	Sys.println ("*** 開始 ***");

	var json_file: String = Sys.args ()[0];

	var key: String = Sys.args ()[1];
	var population: Int = Std.parseInt (Sys.args ()[2]);
	Sys.println (key);
	Sys.println (population);

	var json_str: String = sys.io.File.getContent (json_file);	

	var dict_aa = Json_manipulate.json_to_dict_proc (json_str);

	if (dict_aa.exists (key))
		{
		dict_aa = Text_manipulate.dict_update_proc (dict_aa,key,population);

		json_str = Json.stringify (dict_aa);

		var fout = sys.io.File.write (json_file, false);

		fout.writeString (json_str);

		fout.close();
		}

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
