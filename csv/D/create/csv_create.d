// -------------------------------------------------------------------
/*
	csv_create.d

						Oct/22/2014
*/
// -------------------------------------------------------------------
module	text_create;

import std.stdio;

import	text_manipulate; 
// -------------------------------------------------------------------
string [string] [string] data_prepare_proc ()
{ 
	string [string] [string] dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1271","千葉","27456","1924-6-12");
	dict_aa = dict_append_proc (dict_aa,"t1272","勝浦","54187","1924-5-9");
	dict_aa = dict_append_proc (dict_aa,"t1273","市原","68391","1924-9-12");
	dict_aa = dict_append_proc (dict_aa,"t1274","流山","24375","1924-3-18");
	dict_aa = dict_append_proc (dict_aa,"t1275","八千代","81736","1924-2-21");
	dict_aa = dict_append_proc (dict_aa,"t1276","我孫子","75129","1924-4-25");
	dict_aa = dict_append_proc (dict_aa,"t1277","鴨川","79234","1924-6-18");
	dict_aa = dict_append_proc (dict_aa,"t1278","銚子","81796","1924-9-17");
	dict_aa = dict_append_proc (dict_aa,"t1279","市川","25318","1924-11-12");

	return	dict_aa;
}

// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string file_out = args[1];
	writefln (file_out);

	string [string] [string] dict_aa = data_prepare_proc ();


	dict_display_proc (dict_aa);

	csv_write_proc (file_out,dict_aa);

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
