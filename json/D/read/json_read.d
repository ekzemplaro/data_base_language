// -------------------------------------------------------------------
/*
	json_read.d

						May/21/2013
*/
// -------------------------------------------------------------------
import	std.stdio;
import	std.file,std.stdio;

import	text_manipulate;
import	json_manipulate;
// -------------------------------------------------------------------
void main (string[] args)
{
	writeln ("*** 開始 ***");

	string json_file = args[1];

	string json_str = readText (json_file);

	string[string][string] dict_aa = json_to_dict_proc (json_str);

	dict_display_proc (dict_aa);

	writeln ("*** 終了 ***");
}

// -------------------------------------------------------------------
