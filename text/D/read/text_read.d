// -------------------------------------------------------------------
/*
	text_read.d

						Mar/11/2011
*/
// -------------------------------------------------------------------
module	text_read;


import std.stdio;
import std.file,std.stdio;

//import std.regexp;

import	text_manipulate; 
// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string file_in = args[1];
	writefln (file_in);

	string [string] [string] dict_aa = text_read_proc (file_in);

	dict_display_proc (dict_aa);

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
