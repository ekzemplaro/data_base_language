// --------------------------------------------------------------------
/*
	csharp/create/text_create.cs

					Apr/08/2017

*/
// --------------------------------------------------------------------
using	System;
using	System.Collections.Generic;

// --------------------------------------------------------------------
class	text_create
{
// --------------------------------------------------------------------
static	int Main (string [] args)
{
	Console.Error.WriteLine ("*** 開始 ***");

	if (args.Length < 1)
		{
		Console.Error.WriteLine ("*** error ***");
		Console.Error.WriteLine ("Type: text_create.exe cities.txt");
		return 1;
		}

	string file_out = args[0];
	Console.WriteLine ("\tfile_out = " + file_out);

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	text_manipulate.text_write_proc (file_out,dict_aa);

	Console.Error.WriteLine ("*** 終了 ***");

	return	0;
}

// --------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2381","名古屋",74125,"2009-1-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2382","豊橋",32687,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2383","岡崎",58392,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2384","一宮",93187,"2009-2-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2385","蒲郡",61978,"2009-1-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2386","常滑",35647,"2009-5-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2387","大府",42786,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2388","瀬戸",14835,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2389","犬山",71324,"2009-10-12");

	return	dict_aa;
}

// --------------------------------------------------------------------
}

// --------------------------------------------------------------------
