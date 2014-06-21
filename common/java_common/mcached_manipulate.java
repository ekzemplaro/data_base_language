// --------------------------------------------------------------
//	java_common/mcached_manipulate.java
//
//					May/28/2012
// --------------------------------------------------------------
import java.io.PrintWriter;

import java.util.HashMap;
import com.danga.MemCached.MemCachedClient;

import  net.arnx.jsonic.JSON; 
// --------------------------------------------------------------
public class mcached_manipulate
{
// --------------------------------------------------------------
public static HashMap <String, HashMap<String,String>>
	mcached_to_dict_proc (MemCachedClient mc,String [] keys_in)
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	for (String key : keys_in)
		{
		String str_json  = (String)mc.get(key);

		if (str_json != null)
			{
//        HashMap <String, Object>  unit_aa = new HashMap <String, Object> ();
        HashMap <String,String>  unit_aa = new HashMap <String,String> ();

        unit_aa = (HashMap <String,String>)JSON.decode (str_json);
/*
        String name = unit_aa.get ("name").toString ();
        String pop_str = unit_aa.get ("population").toString ();
        String date_mod = unit_aa.get ("date_mod").toString ();
*/
			dict_aa.put (key,unit_aa);
			}
		}

	return	dict_aa;
}

// --------------------------------------------------------------
static void mcached_read_single (MemCachedClient mc,String key)
{
	String str_json  = (String)mc.get (key);

if (str_json != null)
{
        HashMap <String, Object>  unit_aa = new HashMap <String, Object> ();

        try
        {
        unit_aa = (HashMap <String, Object>)JSON.decode (str_json);
        String name = unit_aa.get ("name").toString ();
        String pop_str = unit_aa.get ("population").toString ();
        String date_mod = unit_aa.get ("date_mod").toString ();

        String out_str = key + "\t" + name + "\t";
        out_str += pop_str + "\t" + date_mod;
        System.out.println (out_str);
        }
        catch (Exception ee)
        {
        ee.printStackTrace ();
        System.out.println (str_json);
        }
}
else
{
//	System.out.println ("*** null ***");
//	System.out.println (str_json);
}

}
 
// --------------------------------------------------------------
public static void data_put_proc 
	(MemCachedClient mc,
	String key,String name_in,int population_in,String date_mod_in)
{
	String value  = json_manipulate.unit_json_gen_proc (name_in,population_in,date_mod_in);
	if(mc.set(key, value))
		{
		System.out.println("set ok");
		}
	else
		{
		System.out.println("set ng");
		}
}

// --------------------------------------------------------------
static String mcached_to_json_proc (MemCachedClient mc,String [] keys_in)
{
	int	icount = 0;

	String out_str = "{";


	for (String key : keys_in)
		{
		String str_json  = (String)mc.get(key);

		if (str_json != null)
			{
			if (0 < icount)
				{
				out_str += ",";
				}
		 	out_str += "\"" + key + "\": " + str_json;

			icount++;
			}
		}

	out_str += "}";

	return	out_str;
}

// --------------------------------------------------------------
static void mcached_update_proc
	(MemCachedClient mc,String key,int population_in)
{

	String str_json  = (String)mc.get(key);

	System.out.println ("str_json = " + str_json);
if (str_json != null)
{
	HashMap <String, Object>  unit_aa = new HashMap <String, Object> ();

	try
	{
	unit_aa = (HashMap <String, Object>)JSON.decode (str_json);
	String name = unit_aa.get ("name").toString ();
	String date_mod = text_manipulate.get_current_date_proc ();

	System.out.println ("key = " + key);
	mcached_manipulate.data_put_proc
		(mc,key,name,population_in,date_mod);
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}
}

}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
