// -------------------------------------------------------------------
/*
	text_manipulate.d

						Oct/21/2011
*/
// -------------------------------------------------------------------
module	text_manipulate;

 
import std.stdio;
import std.file,std.stdio;
// import std.regexp;
//import std.regex;

import std.datetime;
import std.conv;
import std.string;

// -------------------------------------------------------------------
string [string] [string] text_read_exec_proc (string file_in,string delimit)
{
	string [string] [string] dict_aa;

	string lines = readText (file_in);

//	RegExp reg = new RegExp("\n");
//	Regex reg = new Regex("\n");
	string [] aa = std.string.split (lines,"\n");

        foreach (line; aa)
        	{
		if (0 < line.length)
			{
//			RegExp reg_bb = new RegExp(delimit);
//			Regex reg_bb = new Regex(delimit);
			string [] wrd = split (line,delimit);
//			string [] wrd = reg_bb.split (line);
			dict_aa = dict_append_proc
				(dict_aa,wrd[0],wrd[1],wrd[2],wrd[3]);
			}
		}

	return	dict_aa;
}

// -------------------------------------------------------------------
string [string] [string] text_read_proc (string file_in)
{
	string delimit = "\t";
	string [string] [string] dict_aa;

	dict_aa = text_read_exec_proc (file_in,delimit);

	return	dict_aa;
}

// -------------------------------------------------------------------
string unit_out_proc (string [string][string] dict_aa,string key,string delimit)
{
	string [string] unit_aa = dict_aa[key];

	string out_str = key ~ delimit ~ unit_aa["name"] ~ delimit;
	out_str ~= unit_aa["population"] ~ delimit ~ unit_aa["date_mod"] ~ "\n";

	return	out_str;
}

// -------------------------------------------------------------------
string [string] [string] dict_append_proc
	(string [string] [string] dict_aa,
	string key, string name, string population, string date_mod)
{
	string [string] unit_aa;

	unit_aa["name"] = name;
	unit_aa["population"] = population;
	unit_aa["date_mod"] = date_mod;

	dict_aa[key] = unit_aa;

	return	dict_aa;
}

// -------------------------------------------------------------------
void dict_display_proc (string [string] [string] dict_aa)
{
	writeln (dict_aa.length);

	string delimit = "\t";
	string	out_str = "";

	string[] keys_aa = dict_aa.keys;

	foreach (string key; keys_aa)
		{
		out_str ~= unit_out_proc (dict_aa,key,delimit);
		}

	writef (out_str);
}

// -------------------------------------------------------------------
void text_write_exec_proc
	(string file_out,string [string] [string] dict_aa,string delimit)
{
	string	out_str = "";

	string[] keys_aa = dict_aa.keys;

	foreach (string key; keys_aa)
		{
		out_str ~= unit_out_proc (dict_aa,key,delimit);
		}

	std.file.write (file_out,out_str);
}

// -------------------------------------------------------------------
void text_write_proc (string file_out,string [string] [string] dict_aa)
{
	string delimit = "\t";

	text_write_exec_proc (file_out,dict_aa,delimit);
}

// -------------------------------------------------------------------
string get_current_date_proc ()
{
	auto currentTime = Clock.currTime();

	auto dt = cast(DateTime)currentTime;
 
	string today = to!string(dt.year) ~ "-";
	today ~= to!string (to!long(dt.month)) ~ "-";
	today ~= to!string(dt.day);

	return	today;
}

// -------------------------------------------------------------------
string [string] [string] dict_update_proc
	(string [string] [string] dict_aa,string key,string population_in)
{
	dict_aa[key]["population"] = population_in;
	dict_aa[key]["date_mod"] = get_current_date_proc ();

	return	dict_aa;
}

// -------------------------------------------------------------------
string [string] [string] csv_read_proc (string file_in)
{
	string delimit = ",";
	string [string] [string] dict_aa;

	dict_aa = text_read_exec_proc (file_in,delimit);

	return	dict_aa;
}

// -------------------------------------------------------------------
void csv_write_proc (string file_out,string [string] [string] dict_aa)
{
	string delimit = ",";

	text_write_exec_proc (file_out,dict_aa,delimit);
}

// -------------------------------------------------------------------
