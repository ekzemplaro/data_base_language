// ------------------------------------------------------------------
//	ftp_create.cs
//
//					Oct/17/2011
//
// ------------------------------------------------------------------
using	System;
using	System.Collections.Generic;

using	Newtonsoft.Json;
// ------------------------------------------------------------------
public class ftp_create
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string url_in = "ftp://host_dbase/city/iwate.json";

	string user = "scott";
	string passwd = "tiger";

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	string str_json = JsonConvert.SerializeObject (dict_aa);

	ftp_manipulate.str_to_ftp_proc (url_in,user,passwd,str_json);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0361","盛岡",34512,"2009-6-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0362","久慈",17954,"2009-5-19");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0363","二戸",26928,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0364","宮古",25197,"2009-12-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0365","遠野",24976,"2009-11-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0366","八幡平",28945,"2009-1-26");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0367","大船渡",56184,"2009-1-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0368","一関",54632,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0369","花巻",23951,"2009-2-12");

	return	dict_aa;
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
