// ------------------------------------------------------------------    
//	redis_delete.java
//
//					Apr/11/2013
//
// ------------------------------------------------------------------    
import	redis.clients.jedis.Jedis;

// ------------------------------------------------------------------    
public class redis_delete
{

// ------------------------------------------------------------------    
public static void main(String[] args)  throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	System.out.println ("\tkey = " + key);

	Jedis jedis = new Jedis("host_dbase");

	jedis.del (key);

	System.out.println ("*** 終了 ***");        

}

// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
