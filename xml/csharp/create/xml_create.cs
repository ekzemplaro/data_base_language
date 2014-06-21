// ----------------------------------------------------------------
/*
	xml_create.cs

					Sep/17/2011

*/
// ----------------------------------------------------------------
using	System;
using	System.Collections.Generic;

// ----------------------------------------------------------------
public static class	xml_create
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string xml_out = args[0];

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

 
	Console.WriteLine ("*** fffff ***");

	text_manipulate.dict_display_proc (dict_aa);

	string xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);

//	Console.WriteLine (xml_str);

	file_io.file_write_proc (xml_out,xml_str);

	Console.WriteLine ("*** 終了 ***");
}

// --------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2261",@"静岡",61398,"2009-2-21");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2262",@"浜松",84527,"2009-7-15");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2263",@"沼津",73826,"2009-8-28");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2264",@"三島",63749,"2009-1-14");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2265",@"富士",43217,"2009-4-5");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2266",@"熱海",36258,"2009-3-11");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2267",@"富士宮",32954,"2009-10-21");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2268",@"藤枝",19725,"2009-11-7");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2269",@"御殿場",45627,"2009-4-1");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2270",@"島田",83746,"2009-3-15");

	return	dict_aa;

}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
