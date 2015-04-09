// -------------------------------------------------------------------
/*
	json_create.d

						May/21/2013
*/
// -------------------------------------------------------------------
module	json_create;

import std.stdio;
import std.json;

import	text_manipulate; 
import	json_manipulate; 
// -------------------------------------------------------------------
string [string] [string] data_prepare_proc ()
{ 
	string [string] [string] dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t0921","宇都宮","32651","1924-2-21");
	dict_aa = dict_append_proc (dict_aa,"t0922","小山","94587","1924-8-25");
	dict_aa = dict_append_proc (dict_aa,"t0923","佐野","68491","1924-7-12");
	dict_aa = dict_append_proc (dict_aa,"t0924","足利","21375","1924-5-18");
	dict_aa = dict_append_proc (dict_aa,"t0925","日光","34786","1924-9-21");
	dict_aa = dict_append_proc (dict_aa,"t0926","下野","73821","1924-8-25");
	dict_aa = dict_append_proc (dict_aa,"t0927","さくら","45913","1924-6-18");
	dict_aa = dict_append_proc (dict_aa,"t0928","矢板","81697","1924-9-17");
	dict_aa = dict_append_proc (dict_aa,"t0929","真岡","97243","1924-10-12");
	dict_aa = dict_append_proc (dict_aa,"t0930","栃木","27358","1924-5-24");
	dict_aa = dict_append_proc (dict_aa,"t0931","大田原","31425","1924-4-8");
	dict_aa = dict_append_proc (dict_aa,"t0932","鹿沼","92684","1924-7-5");
	dict_aa = dict_append_proc (dict_aa,"t0933","那須塩原","75851","1924-9-2");
	dict_aa = dict_append_proc (dict_aa,"t0934","那須烏山","83246","1924-1-18");

	return	dict_aa;
}

// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string file_out = args[1];
	writefln (file_out);

	string [string][string] dict_aa = data_prepare_proc ();

	dict_display_proc (dict_aa);

	string out_str = dict_to_json_proc (dict_aa);

	std.file.write (file_out,out_str);

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
