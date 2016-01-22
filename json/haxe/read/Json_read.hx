// --------------------------------------------------------------
//
//	Json_read.hx
//
//					Jan/12/2016
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

	var dict_aa = Json_manipulate.json_to_dict_proc (json_str);

	Text_manipulate.dict_display_proc (dict_aa);

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
