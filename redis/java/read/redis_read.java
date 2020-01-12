// -------------------------------------------------------------
//
//	redis_read.java
//
//						Jan/12/2020
// -------------------------------------------------------------
import redis.clients.jedis.Jedis;

import	java.util.HashMap;
import	java.util.Set;
// -------------------------------------------------------------
public class redis_read {

// -------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	Jedis jedis = new Jedis("localhost");

	Set set_keys = jedis.keys("*");
//	System.out.println(set_keys);
	for (Object obj : set_keys)
		{
		String key = obj.toString ();
		String str_json = jedis.get(key);
//		System.out.println (str_json);

		if (str_json != null)
			{
			HashMap <String,String>  unit_aa = json_manipulate.unit_json_parser (str_json);
			System.out.print (key + "\t");
			System.out.print (unit_aa.get ("name") + "\t");
			Object ppx = unit_aa.get ("population");
			System.out.print (ppx + "\t");

			System.out.println (unit_aa.get ("date_mod"));
			}
		}

	System.out.println ("*** 終了 ***");
}
// -------------------------------------------------------------

}
// -------------------------------------------------------------


// -------------------------------------------------------------
