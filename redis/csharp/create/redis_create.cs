// -------------------------------------------------------------
//
//	redis_create.cs
//
//					Mar/27/2013
// -------------------------------------------------------------
using System;

// -------------------------------------------------------------
class redis_create
{

// -------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

        Redis rd = new Redis ("host_dbase",6379);

	redis_set_proc (rd,"t1851",@"福井",43125,"2009-11-12");
	redis_set_proc (rd,"t1852",@"敦賀",69287,"2009-7-9");
	redis_set_proc (rd,"t1854",@"大野",34795,"2009-6-3");
	redis_set_proc (rd,"t1853",@"小浜",25718,"2009-4-24");
	redis_set_proc (rd,"t1855",@"勝山",42531,"2009-8-14");
	redis_set_proc (rd,"t1856",@"鯖江",31957,"2009-9-4");
	redis_set_proc (rd,"t1857",@"あわら",92864,"2009-3-7");
	redis_set_proc (rd,"t1858",@"越前",45632,"2009-1-5");
	redis_set_proc (rd,"t1859",@"坂井",78321,"2009-2-17");

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------
static void redis_set_proc
	(Redis rd,String key,String name,int population,String date_mod)
{
	String json_new = kvalue_manipulate.json_create_proc
		(name,population,date_mod);

	Console.WriteLine (json_new);

	rd.Set (key, json_new);
}

// -------------------------------------------------------------
}
// -------------------------------------------------------------
