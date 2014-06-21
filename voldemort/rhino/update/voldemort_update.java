// --------------------------------------------------------------
//
//	voldemort_update.java
//
//					Jul/27/2011
//
// --------------------------------------------------------------
import voldemort.client.ClientConfig;
import voldemort.client.SocketStoreClientFactory;
import voldemort.client.StoreClient;
import voldemort.client.StoreClientFactory;
import voldemort.versioning.Versioned;

import	net.arnx.jsonic.JSON;

import	java.util.HashMap;
// --------------------------------------------------------------
public class voldemort_update
{

// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	String storeName    = "cities";

	String bootstrapUrl = "tcp://localhost:6666";
	StoreClientFactory factory = new SocketStoreClientFactory
		(new ClientConfig().setBootstrapUrls(bootstrapUrl));

	StoreClient<String, String> client = factory.getStoreClient (storeName);

	Versioned<String> value = client.get (key);

	if (value != null)
		{
		String str_json = value.getValue ();

		System.out.println (str_json);

		try
	{
	HashMap <String, Object>unit_aa = (HashMap <String, Object>)JSON.decode (str_json);
	String name = unit_aa.get ("name").toString ();
	String date_mod = text_manipulate.get_current_date_proc ();
		System.out.println (name);
		System.out.println (date_mod);

String str_json_new  = mcached_manipulate.json_create_proc
		 (name,population,date_mod);
		System.out.println (str_json_new);
		client.put (key,str_json_new);
}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}
		}


	System.out.println ("***** 終了 *****");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
