// --------------------------------------------------------------------
/*
	csharp/update/json_update.cs

					Aug/01/2014

*/
// --------------------------------------------------------------------
using	System;
using	System.IO;
using	System.Collections.Generic;

using Newtonsoft.Json;
// --------------------------------------------------------------------
class	json_update
{
// --------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string file_json = args[0];

	string	key_in = args[1];
	int	population_in = int.Parse (args[2]);
	Console.WriteLine (key_in + "\t" + population_in);

	try
		{
		string str_json = file_io.file_to_str_proc (file_json);

		Dictionary <string,Object> dict_aa
			 = json_manipulate.json_to_dict_proc (str_json);

		dict_aa = text_manipulate.dict_update_proc
			(dict_aa,key_in,population_in);

		string str_json_out = JsonConvert.SerializeObject (dict_aa);
	
		file_io.file_write_proc (file_json,str_json_out);
		}
	catch (FileNotFoundException ex)
		{
		Console.WriteLine ("*** FileNotFoundException ***");
		Console.WriteLine (ex);
		}

	Console.WriteLine ("*** 終了 ***");
}

// --------------------------------------------------------------------
}

// --------------------------------------------------------------------
