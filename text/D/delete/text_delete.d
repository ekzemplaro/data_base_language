// -------------------------------------------------------------------
/*
	text_delete.d

						Oct/21/2011
*/
// -------------------------------------------------------------------
module	text_delete;

import std.stdio;
import std.file,std.stdio;
import std.conv;

import	text_manipulate; 
// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string file_txt = args[1];
	string id_in = args[2];

	writefln (file_txt);
	writefln (id_in);

	string [string] [string] dict_aa = text_read_proc (file_txt);

	dict_aa.remove (id_in);

	dict_display_proc (dict_aa);

	text_write_proc (file_txt,dict_aa);

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
