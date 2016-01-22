// --------------------------------------------------------------
//	Riak_read.hx
//
//					Jan/13/2016
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

	var url_shimane="http://host_ubuntu:8098/riak/shimane";
	var url_in = url_shimane + "?keys=true";
	var str_aa = haxe.Http.requestUrl(url_in);

	var data_aa = Json.parse (str_aa);

//	var keys : Array<Dynamic> = data_aa.keys;
	var keys : Array<String> = data_aa.keys;

	for (key in keys)
		{
		var url = url_shimane + "/" + key;
		var str_json = haxe.Http.requestUrl(url);
		Json_manipulate.json_parser (key,str_json);
		}

	Sys.println ("*** 終了 ***");
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
