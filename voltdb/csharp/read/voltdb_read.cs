// ----------------------------------------------------------------
/*
	voltdb_read.cs

					Jan/30/2012

*/
// ----------------------------------------------------------------
using System;
using VoltDB.Data.Client;

using System.Collections.Generic;
// ----------------------------------------------------------------
class voltdb_read
{
// ----------------------------------------------------------------
static void Main(string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	List <String> keys = new List <String> ()
		{"t3951","t3952","t3953","t3954","t3955",
		"t3956","t3957","t3958","t3959"};
	try
	{
	using (var connection = VoltConnection.Create("hosts=localhost").Open())
		{
		foreach (String key in keys)
		{
		row_display_proc (connection,key);
		}
		}
	}
	catch (Exception ee)
		{
		Console.WriteLine(ee.ToString());
		}

	Console.WriteLine("*** 終了 ***");
}

// ----------------------------------------------------------------
static void row_display_proc (VoltConnection connection,String key_in)
{
	var Select = connection.Procedures.Wrap<SingleRowTable, string>("Select");
	var result = Select.Execute(key_in).Result.Wrap<string, string,string,string>();

	if (result.HasData)
		{
		Console.WriteLine("{0}\t{1}\t{2}\t{3}",
			result.Column1, result.Column2,
			result.Column3, result.Column4);
		}
		else
		{
		Console.WriteLine("I can't say Hello in that language!");
		}
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
