// ------------------------------------------------------------------    
//	redis_delete.java
//
//					Jan/13/2020
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

	Jedis jedis = new Jedis("localhost");

	jedis.del (key);

	System.out.println ("*** 終了 ***");        

}

// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
