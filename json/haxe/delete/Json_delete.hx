// --------------------------------------------------------------
//
//	Json_delete.hx
//
//					Feb/11/2016
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Json_delete
{
// --------------------------------------------------------------
public static function main()
{
	Sys.println ("*** 開始 ***");

	var json_file: String = Sys.args ()[0];

	var key: String = Sys.args ()[1];
	Sys.println (key);

	var json_str: String = sys.io.File.getContent (json_file);	

	var dict_aa = Json_manipulate.json_to_dict_proc (json_str);

	if (dict_aa.exists (key))
		{
		dict_aa.remove (key);

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
