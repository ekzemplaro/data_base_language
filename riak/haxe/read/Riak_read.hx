// --------------------------------------------------------------
//	Riak_read.hx
//
//						Feb/26/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Riak_read
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main()
{
	Sys.println ("*** 開始 ***");

	var url_shimane="http://localhost:8098/riak/shimane";
	var url_in = url_shimane + "?keys=true";
	var str_aa = haxe.Http.requestUrl(url_in);

	var data_aa = Json.parse (str_aa);

//	var keys : Array<Dynamic> = data_aa.keys;
	var keys : Array<String> = data_aa.keys;

	for (key in keys)
		{
		var url = url_shimane + "/" + key;
		var str_json = haxe.Http.requestUrl(url);
		Mcached_manipulate.json_parser (key,str_json);
		}

	Sys.println ("*** 終了 ***");
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
