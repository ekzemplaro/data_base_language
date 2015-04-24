// --------------------------------------------------------
/*
	xlsx_create.cs

					Apr/21/2015


*/
// --------------------------------------------------------
using	System;
using	System.IO;
using	System.Collections.Generic;
using	System.Linq;
using	System.Text;

using	OfficeOpenXml;
using	OfficeOpenXml.Style;
// --------------------------------------------------------
class	xlsx_create
{
// --------------------------------------------------------
static	void	Main (string [] args)
{
	Console.WriteLine ("*** 開始 ***");

	string file_xlsx = args[0];
	Console.WriteLine ("\tfile_xlsx = " + file_xlsx);

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	xlsx_manipulate.dict_to_xlsx_proc (dict_aa,file_xlsx);


	Console.WriteLine ("*** 終了 ***");
}

// --------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2971","奈良",193825,"2009-10-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2972","大和高田",324657,"2009-6-24");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2973","大和郡山",583712,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2974","天理",923187,"2009-5-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2975","橿原",651978,"2009-3-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2976","桜井",325647,"2009-8-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2977","五條",412786,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2978","御所",174835,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2979","生駒",715324,"2009-10-12");

	return	dict_aa;
}
// --------------------------------------------------------
}

// --------------------------------------------------------
