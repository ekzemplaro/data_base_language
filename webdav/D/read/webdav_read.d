// -------------------------------------------------------------------
/*
	webdav_read.d

						Jun/10/2013
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

	string url_in = "http://host_dbase:3004/city/tokyo.json";

	auto content = get (url_in);

	auto result  = parseJSON(content);

	foreach(key, unit_aa; result.object)
		{
		write (key ~ "\t");
		record_parse_proc (key,unit_aa);
		}

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
