// -------------------------------------------------------------------
/*
	xml_create.d

						Feb/22/2012
*/
// -------------------------------------------------------------------
module	xml_create;

import	std.stdio;

import	text_manipulate; 
import	xml_manipulate; 
// -------------------------------------------------------------------
string [string] [string] data_prepare_proc ()
{ 
	string [string] [string] dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t2261","静岡","97264","1924-3-5");
	dict_aa = dict_append_proc (dict_aa,"t2262","浜松","52187","1924-7-25");
	dict_aa = dict_append_proc (dict_aa,"t2263","沼津","65291","1924-2-8");
	dict_aa = dict_append_proc (dict_aa,"t2264","三島","25375","1924-4-14");
	dict_aa = dict_append_proc (dict_aa,"t2265","富士","31468","1924-9-22");
	dict_aa = dict_append_proc (dict_aa,"t2266","熱海","24731","1924-4-25");
	dict_aa = dict_append_proc (dict_aa,"t2267","富士宮","45213","1924-6-18");
	dict_aa = dict_append_proc (dict_aa,"t2268","藤枝","83697","1924-9-17");
	dict_aa = dict_append_proc (dict_aa,"t2269","御殿場","97253","1924-10-12");
	dict_aa = dict_append_proc (dict_aa,"t2270","島田","27358","1924-5-24");

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

	xml_write_proc (file_out,dict_aa);

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
