// -------------------------------------------------------------------
/*
	csv_read.d

						Oct/21/2011
*/
// -------------------------------------------------------------------
module	csv_read;

import std.stdio;
import std.file,std.stdio;

import	text_manipulate; 
// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string file_in = args[1];
	writefln (file_in);

	string [string] [string] dict_aa = csv_read_proc (file_in);

	dict_display_proc (dict_aa);

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
