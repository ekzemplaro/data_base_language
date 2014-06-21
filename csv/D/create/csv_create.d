// -------------------------------------------------------------------
/*
	csv_create.d

						Jun/06/2011
*/
// -------------------------------------------------------------------
module	text_create;

import std.stdio;

import	text_manipulate; 
// -------------------------------------------------------------------
string [string] [string] data_prepare_proc ()
{ 
	string [string] [string] dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1271","千葉","27456","1988-6-12");
	dict_aa = dict_append_proc (dict_aa,"t1272","勝浦","54187","1988-5-9");
	dict_aa = dict_append_proc (dict_aa,"t1273","市原","68391","1988-9-12");
	dict_aa = dict_append_proc (dict_aa,"t1274","流山","24375","1988-3-18");
	dict_aa = dict_append_proc (dict_aa,"t1275","八千代","31736","1988-2-21");
	dict_aa = dict_append_proc (dict_aa,"t1276","我孫子","75424","1988-4-25");
	dict_aa = dict_append_proc (dict_aa,"t1277","鴨川","45234","1988-6-18");
	dict_aa = dict_append_proc (dict_aa,"t1278","銚子","81796","1988-9-17");
	dict_aa = dict_append_proc (dict_aa,"t1279","市川","25318","1988-11-12");

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
