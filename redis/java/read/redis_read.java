// -------------------------------------------------------------
//
//	redis_read.java
//
//						Apr/11/2013
// -------------------------------------------------------------
import redis.clients.jedis.Jedis;

import	java.util.Set;
// -------------------------------------------------------------
public class redis_read {

// -------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	Jedis jedis = new Jedis("host_dbase");

	Set set_keys = jedis.keys("*");
//	System.out.println(set_keys);
	for (Object obj : set_keys)
		{
		String key = obj.toString ();
		String str_json = jedis.get(key);
//		System.out.println (str_json);

		if (str_json != null)
			{
			redis_manipulate.record_parse_proc
						(key,str_json);
			}
		}

	System.out.println ("*** 終了 ***");
}
// -------------------------------------------------------------

}
// -------------------------------------------------------------


// -------------------------------------------------------------
