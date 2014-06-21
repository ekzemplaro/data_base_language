// -------------------------------------------------------------------
//
//	tcbn_manipulate.java
//
//					Jan/27/2012
// -------------------------------------------------------------------
import	java.io.PrintWriter;
import	java.util.List;

import	tokyocabinet.BDB;

// -------------------------------------------------------------------
public class tcbn_manipulate
{
// -------------------------------------------------------------------
static void update_proc (BDB bdb,String key,int population)
{
	String json_str = bdb.get (key);

System.out.println ("*** tcbn_update ***");

	String json_new = redis_manipulate.create_new_json_proc (json_str,population);

	if(!bdb.put(key, json_new))
		{
		int ecode = bdb.ecode();
		System.err.println("put error: " + bdb.errmsg(ecode));
		}
}

// -------------------------------------------------------------------
static void delete_proc (BDB bdb,String key)
{
	bdb.out (key);

System.out.println ("*** tcbn_delete ***");

}

// -------------------------------------------------------------------
static void display_proc (BDB bdb)
{
	List keys = bdb.range ("t0800",true,"t0900",true,100);
	System.out.println ("keys = " + keys.size ());
	for (Object key  : keys)
		{
//		System.out.println ("key = " + key);
		String str_json = bdb.get((String)key);
		if (str_json != null)
			{
			redis_manipulate.record_parse_proc
						((String)key,str_json);
			}
		}
}
// -------------------------------------------------------------------
static void tcbn_to_json_proc (BDB bdb,PrintWriter out) throws Exception
{
	int	icount = 0;

	sql_to_json.json_header_out_proc  (out);

	List keys = bdb.range ("800",true,"900",true,100);
	System.out.println ("keys = " + keys.size ());
	for (Object key  : keys)
		{
		String str_key   = (String)key;

//		System.out.println ("key = " + key);

		String str_json = bdb.get(str_key);

		String json_new = "{\"id\":" + str_key + "," + str_json.substring (1);

		if (str_json != null)
			{
			if (0 < icount)
				{
				out.println (",");
				}

			out.println (json_new);

			icount++;
			}
		}

	sql_to_json.json_tail_out_proc  (out);
}

// -------------------------------------------------------------------
static void insert_proc
	(BDB bdb,String key,String name_in,int population,String date_mod)
{
	String json_new = json_manipulate.unit_json_gen_proc
		 (name_in,population,date_mod);

	if(!bdb.put(key, json_new))
		{
		int ecode = bdb.ecode();
		System.err.println("put error: " + bdb.errmsg(ecode));
		}
}
// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
