// ------------------------------------------------------------------    
//	redis_create.java
//
//					Jan/12/2020
//
// ------------------------------------------------------------------    
import	java.util.HashMap;
import	java.util.Set;

import redis.clients.jedis.Jedis;

// ------------------------------------------------------------------    
public class redis_create
{

// ------------------------------------------------------------------    
public static void main(String[] args)  throws Exception
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
			dict_aa = data_prepare_proc ();

	Jedis jedis = new Jedis("localhost");

	Set set_aaa = dict_aa.keySet ();

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;
		HashMap <String,String>
			dict_unit = dict_aa.get (key_aa);

		String str_json = json_manipulate.unit_json_gen_proc (dict_unit);
		System.out.println (str_json);        
		jedis.set (key,str_json);
		}

	System.out.println ("*** 終了 ***");        
}

// ------------------------------------------------------------------    
static HashMap <String, HashMap <String,String>> data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1851","福井",48792,"2008-7-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1852","敦賀",23167,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1853","小浜",86391,"2008-4-18");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1854","大野",42813,"2008-2-8");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1855","勝山",31524,"2008-9-9");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1856","鯖江",13267,"2008-5-11");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1857","あわら",25738,"2008-8-30");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1858","越前",85291,"2008-10-18");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1859","坂井",94156,"2008-12-12");

	return	dict_aa;
}

// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
