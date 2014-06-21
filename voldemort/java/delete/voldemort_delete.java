// --------------------------------------------------------------
//
//	voldemort_delete.java
//
//					Dec/16/2011
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
public class voldemort_delete
{

// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	System.out.println ("\tkey = " + key);

	String storeName    = "cities";

	String bootstrapUrl = "tcp://localhost:6666";
	StoreClientFactory factory = new SocketStoreClientFactory
		(new ClientConfig().setBootstrapUrls(bootstrapUrl));

	StoreClient<String, String> client = factory.getStoreClient (storeName);

	Versioned<String> version = client.get (key);

	if (version != null)
		{
		String str_json = version.getValue ();

		System.out.println (str_json);

		try
	{
	HashMap <String, Object>unit_aa = (HashMap <String, Object>)JSON.decode (str_json);
	String name = unit_aa.get ("name").toString ();
	String date_mod = text_manipulate.get_current_date_proc ();
		System.out.println (name);
		System.out.println (date_mod);

		client.delete (key);
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
