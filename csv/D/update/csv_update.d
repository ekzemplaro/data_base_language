// -------------------------------------------------------------------
/*
	csv_update.d

						Oct/21/2011
*/
// -------------------------------------------------------------------
module	csv_update;

import std.stdio;
import std.file,std.stdio;

import	text_manipulate; 
// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string file_txt = args[1];
	string id_in = args[2];
	string population_in = args[3];

	writefln (file_txt);
	writefln (id_in ~ "\t" ~ population_in);

	string [string] [string] dict_aa = csv_read_proc (file_txt);

	dict_aa = dict_update_proc (dict_aa,id_in,population_in);

	dict_display_proc (dict_aa);

	csv_write_proc (file_txt,dict_aa);

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
