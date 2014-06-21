// --------------------------------------------------------------
//	tyrant_create.java
//
//					Aug/20/2013
// --------------------------------------------------------------
import	java.util.HashMap;
import	java.util.Set;

import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;
 
// --------------------------------------------------------------
public class tyrant_create{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");
 
                // SockIOPool を初期化
	String[] serverlist = { "localhost:1978" };
	SockIOPool pool = SockIOPool.getInstance();
	pool.setServers(serverlist);
	pool.setHashingAlg(SockIOPool.NEW_COMPAT_HASH);
	pool.initialize();

	MemCachedClient mc = new MemCachedClient();
	mc.setPrimitiveAsString (true);
	mc.setSanitizeKeys (false);

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	Set set_aaa = dict_aa.keySet ();
	System.out.println (set_aaa);

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;

HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

		dict_unit = dict_aa.get (key_aa);
		String name = dict_unit.get ("name");
		String ppx = dict_unit.get ("population");

		int population = Integer.parseInt (ppx);

		String date_mod = dict_unit.get ("date_mod");
	mcached_manipulate.data_put_proc (mc,key,name,population,date_mod);
		}


	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4761","那覇",27689,"2008-5-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4762","宜野湾",49382,"2008-9-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4763","石垣",32753,"2008-3-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4764","浦添",89624,"2008-2-18");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4765","名護",72539,"2008-10-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4766","糸満",28514,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4767","沖縄",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4768","豊見城",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4769","うるま",51872,"2008-10-24");

	return	dict_aa;
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
