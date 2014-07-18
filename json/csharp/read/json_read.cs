// --------------------------------------------------------------------
/*
	json_read.cs

						Jul/04/2014
*/
// --------------------------------------------------------------------
using	System;
using	System.IO;
using	System.Collections.Generic;

using	Codeplex.Data;
// --------------------------------------------------------------------
class	json_read
{
// --------------------------------------------------------------------
static	void	Main (string[] args)
{
	Console.WriteLine ("*** json_read *** 開始 ***\n");

	string file_in = args[0];

	try
		{
		string str_json = file_io.file_to_str_proc (file_in);

		var array_json = DynamicJson.Parse (str_json);

		foreach (KeyValuePair<string, dynamic> item in array_json)
			{
			Console.Write (item.Key + "\t" + item.Value.name);
			Console.Write ("\t" + item.Value.population);
			Console.WriteLine ("\t" + item.Value.date_mod);
			}
		}
	catch (DirectoryNotFoundException ex)
		{
		Console.WriteLine ("*** DirectoryNotFoundException ***");
//		Console.WriteLine (ex);
		}
	catch (FileNotFoundException ex)
		{
		Console.WriteLine ("*** FileNotFoundException ***");
//		Console.WriteLine (ex);
		}
	
	Console.WriteLine ("\n*** json_read *** 終了 ***");
}

// --------------------------------------------------------------------
}

// --------------------------------------------------------------------

