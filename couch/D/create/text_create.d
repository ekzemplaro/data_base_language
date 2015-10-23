// -------------------------------------------------------------------
/*
	text_create.d

						Oct/26/2011
*/
// -------------------------------------------------------------------
module	text_create;

import std.stdio;

import	text_manipulate; 
// -------------------------------------------------------------------
string [string] [string] data_prepare_proc ()
{ 
	string [string] [string] dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t2381","名古屋","92326","1924-4-15");
	dict_aa = dict_append_proc (dict_aa,"t2382","豊橋","54387","1924-8-25");
	dict_aa = dict_append_proc (dict_aa,"t2383","岡崎","68391","1924-9-12");
	dict_aa = dict_append_proc (dict_aa,"t2384","一宮","26375","1924-5-18");
	dict_aa = dict_append_proc (dict_aa,"t2385","蒲郡","31736","1924-2-21");
	dict_aa = dict_append_proc (dict_aa,"t2386","常滑","75424","1924-4-25");
	dict_aa = dict_append_proc (dict_aa,"t2387","大府","45697","1924-6-18");
	dict_aa = dict_append_proc (dict_aa,"t2388","瀬戸","89481","1924-9-17");
	dict_aa = dict_append_proc (dict_aa,"t2389","犬山","97253","1924-10-12");

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

	text_write_proc (file_out,dict_aa);

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
