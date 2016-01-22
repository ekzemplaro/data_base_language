// --------------------------------------------------------------
//
//	Json_delete.hx
//
//					Jan/12/2016
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Json_delete
{
// --------------------------------------------------------------
public static function main()
{
	Sys.println ("*** 開始 ***");

	var json_file = Sys.args ()[0];

	var key = Sys.args ()[1];
	Sys.println (key);

	var json_str = sys.io.File.getContent (json_file);	

	var dict_aa = Json_manipulate.json_to_dict_proc (json_str);

	if (dict_aa.exists (key))
		{
		dict_aa.remove (key);

		var json_str = Json.stringify (dict_aa);

		var fout = sys.io.File.write (json_file, false);

		fout.writeString (json_str);

		fout.close();
		}

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
