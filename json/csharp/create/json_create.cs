// --------------------------------------------------------------------
/*
	csharp/create/json_create.cs

					May/18/2015


*/
// --------------------------------------------------------------------
using	System;
using	System.IO;
using	System.Collections.Generic;

using Newtonsoft.Json.Utilities;
using NUnit.Framework;
using Newtonsoft.Json;
// --------------------------------------------------------------------
class	json_create
{
// --------------------------------------------------------------------
static	void	Main (string [] args)
{
	Console.WriteLine ("*** 開始 ***");

	string file_out = args[0];

	Console.WriteLine ("file_out = " + file_out + "\n");

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	string str_json = JsonConvert.SerializeObject (dict_aa);

	file_io.file_write_proc (file_out,str_json);

	Console.WriteLine ("*** 終了 ***");
}

// --------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0921","宇都宮",31569,"2009-6-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0922","小山",17982,"2009-5-19");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0923","佐野",46819,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0924","足利",65297,"2009-12-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0925","日光",14926,"2009-11-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0926","下野",28145,"2009-1-26");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0927","さくら",56784,"2009-1-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0928","矢板",93218,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0929","真岡",54123,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0930","栃木",82715,"2009-1-14");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0931","大田原",19325,"2009-8-9");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0932","鹿沼",91678,"2009-12-15");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0933","那須塩原",57231,"2009-12-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0934","那須烏山",51489,"2009-2-24");

	return	dict_aa;
}

// --------------------------------------------------------------------
}

// --------------------------------------------------------------------
