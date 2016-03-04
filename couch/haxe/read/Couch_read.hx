// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Couch_read
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main()
{
	Sys.println ("*** 開始 ***");

	var url="http://localhost:5984/nagano";

	var url_all_docs = url + "/" + "_all_docs?include_docs=true";

	var str_get = haxe.Http.requestUrl (url_all_docs);

	var data_aa = Json.parse (str_get);

	var rows  = data_aa.rows;

	var id = rows[0].id;

	for (unit in rows)
		{
		Sys.print (unit.id + '\t');
		Sys.print (unit.doc.name + '\t');
		Sys.print (unit.doc.population + '\t');
		Sys.print (unit.doc.date_mod + '\n');
		}

	Sys.println ("*** 終了 ***");
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
