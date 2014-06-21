// --------------------------------------------------------------
//
//	voldemort_read.java
//
//					Dec/16/2011
//
// --------------------------------------------------------------
import voldemort.client.ClientConfig;
import voldemort.client.SocketStoreClientFactory;
import voldemort.client.StoreClient;
import voldemort.client.StoreClientFactory;


import	java.util.HashMap;
// --------------------------------------------------------------
public class voldemort_read {

// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String storeName    = "cities";

        // In real life this stuff would get wired in
	String bootstrapUrl = "tcp://localhost:6666";
	StoreClientFactory factory = new SocketStoreClientFactory
		(new ClientConfig().setBootstrapUrls(bootstrapUrl));

	StoreClient<String, String> client = factory.getStoreClient (storeName);

	HashMap <String, HashMap<String,String>> dict_aa
		= voldemort_manipulate.voldemort_to_dict_proc (client);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("***** 終了 *****");

}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
