// -------------------------------------------------------------
//
//	redis_update.cs
//
//						Mar/27/2013
// -------------------------------------------------------------
using System;

// -------------------------------------------------------------
class redis_update
{

// -------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	String	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.WriteLine (id_in + "\t" + population_in);

	Redis rd = new Redis ("host_dbase",6379);

	redis_manipulate.update_proc (rd,id_in,population_in);

	Console.WriteLine ("*** 終了 ***");
}
// -------------------------------------------------------------
}
// -------------------------------------------------------------
