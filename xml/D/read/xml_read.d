// -------------------------------------------------------------------
/*
	xml_read.d

						Sep/30/2013
*/
// -------------------------------------------------------------------
import std.xml;
import std.stdio;
import std.string;
import std.file;

struct City
{
    string id;
    string name;
    string population;
    string date_mod;
}

// -------------------------------------------------------------------
void main (string[] args)
{
	writeln ("*** 開始 ***");
	string xml_file = args[1];

	string ss = cast(string)std.file.read (xml_file);

	writeln (ss);

	check (ss);

	City[] cities;

	auto xml = new DocumentParser (ss);
	xml.onStartTag["cities"] = (ElementParser xml)
	{
	City city;

//	xml.onEndTag["id"]       = (in Element e) {city.id = e.text; };
	xml.onEndTag["name"]       = (in Element e) {city.name = e.text; };
	xml.onEndTag["population"] = (in Element e) {city.population = e.text;};
	xml.onEndTag["date_mod"] = (in Element e) {city.date_mod = e.text; };

	xml.parse();

	cities ~= city;
	};

	xml.parse();

	foreach(city;cities)
	{
	string out_str = city.id ~ "\t" ~ city.name ~ "\t" ~ city.population
		~ "\t" ~ city.date_mod;
	writeln (out_str);
	}

	writeln ("*** 終了 ***");
}

// -------------------------------------------------------------------
