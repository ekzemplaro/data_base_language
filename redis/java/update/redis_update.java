// ------------------------------------------------------------------    
//	redis_update.java
//
//					Apr/11/2013
//
// ------------------------------------------------------------------    
import	redis.clients.jedis.Jedis;

// ------------------------------------------------------------------    
public class redis_update
{

// ------------------------------------------------------------------    
public static void main(String[] args)  throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	Jedis jedis = new Jedis("host_dbase");

	redis_manipulate.redis_update_proc (jedis,key,population);

	System.out.println ("*** 終了 ***");        
}

// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
