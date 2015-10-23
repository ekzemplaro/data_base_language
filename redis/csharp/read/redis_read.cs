// -------------------------------------------------------------
//
//	redis_read.cs
//
//						Jun/16/2014
// -------------------------------------------------------------
using System;
using System.Collections.Generic;

using	Codeplex.Data;
// -------------------------------------------------------------
class redis_read
{

// -------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	Redis rd = new Redis ("host_dbase",6379);

	List <String> keys = new List <String> ()
		{"t1851","t1852","t1853","t1854","t1855",
		"t1856","t1857","t1858","t1859"};

	foreach (String key in keys)
		{
		String json_str = null;

		try
			{
			json_str = rd.GetString (key);

			if (json_str != null)
				{
				var unit_bb = DynamicJson.Parse (json_str);

				Console.Write (key + "\t");
				Console.Write (unit_bb.name + "\t");
				Console.Write (unit_bb.population + "\t");
				Console.WriteLine (unit_bb.date_mod + "\t");
				}
			}
		catch	(Exception exp)
			{
		Console.Error.WriteLine ("*** error *** " + exp);
			}

		}

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------
}
// -------------------------------------------------------------
