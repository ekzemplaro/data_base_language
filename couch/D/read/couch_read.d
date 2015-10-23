// -------------------------------------------------------------------
/*
	couch_read.d

						Sep/30/2013
*/
// -------------------------------------------------------------------
import std.stdio;
import std.net.curl;
import std.json;
import std.conv;

// -------------------------------------------------------------------
void main ()
{
	writefln ("*** 開始 ***");

//	string url_in = "http://host_dbase:5984/city/cities";
	string url_in = "http://cddn007:5984/city/cities";


	auto client = HTTP(url_in);
	client.proxy = "";
	client.method = HTTP.Method.get;

	client.onReceiveHeader =
    (in char[] key, in char[] value) { writeln ("key = ",key, ": ", value); };
	client.onReceive = (ubyte[] data)
		{
//		writeln (data);

		/+ drop +/ return data.length;
		};
	client.perform();

//	writeln (data);

//	foreach (line; byLine("url_in", client))
//		writeln(line);
/*
	auto content = get (url_in);

	auto result  = parseJSON(content);

	foreach(key, unit_aa; result.object)
		{
		if ((key != "_id") && (key != "_rev"))
			{
			write (key ~ "\t");
			record_parse_proc (key,unit_aa);
			}
		}
*/
	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
void record_parse_proc (string key,JSONValue unit_aa)
{
	write (unit_aa.object["name"].str ~ "\t");
	ulong iix = unit_aa.object["population"].integer;

	write (text(iix) ~ "\t");
	write (unit_aa.object["date_mod"].str ~ "\n");
}

// -------------------------------------------------------------------
