// --------------------------------------------------------------------
/*
	csharp/create/csv_create.cs

				Jul/16/2016


*/
// --------------------------------------------------------------------
using	System;
using	System.Collections.Generic;

// --------------------------------------------------------------------
class	csv_create
{
// --------------------------------------------------------------------
static	void	Main (string [] args)
{
	Console.WriteLine ("*** csv_create *** 開始 ***");

	string file_out = args[0];
	Console.WriteLine ("\tfile_out = " + file_out + "\n");

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	text_manipulate.csv_write_proc (file_out,dict_aa);

	Console.WriteLine ("\n*** csv_create *** 終了 ***");
}

// --------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();


	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1271","千葉",49215,"2009-1-07");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1272","勝浦",13657,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1273","市原",28476,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1274","流山",29513,"2009-2-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1275","八千代",51978,"2009-1-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1276","我孫子",21647,"2009-5-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1277","鴨川",43186,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1278","銚子",54139,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1279","市川",71324,"2009-10-12");

	return	dict_aa;
}

// --------------------------------------------------------------------
}

// --------------------------------------------------------------------
