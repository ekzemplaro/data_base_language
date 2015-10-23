// -------------------------------------------------------------------
/*
	json_delete.d

						May/21/2013
*/
// -------------------------------------------------------------------
import	std.stdio;
import	std.file,std.stdio;
import	std.json;
import	std.conv;

import	text_manipulate;
import	json_manipulate;

// -------------------------------------------------------------------
void main (string[] args)
{
	writeln ("*** 開始 ***");

	string json_file = args[1];
	string key_in = args[2];

	writefln (json_file);
	writefln (key_in);

	string json_str = readText (json_file);

	string[string][string] dict_aa = json_to_dict_proc (json_str);

	dict_aa.remove (key_in);

	dict_display_proc (dict_aa);

	string out_str = dict_to_json_proc (dict_aa);

	std.file.write (json_file,out_str);

	writeln ("*** 終了 ***");
}

// -------------------------------------------------------------------
