// --------------------------------------------------------------
//
//	voldemort_create.java
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
import	java.util.Set;
// --------------------------------------------------------------
public class voldemort_create {

// --------------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	text_manipulate.dict_display_proc (dict_aa);

	String storeName    = "cities";

        // In real life this stuff would get wired in
	String bootstrapUrl = "tcp://localhost:6666";
	StoreClientFactory factory = new SocketStoreClientFactory
		(new ClientConfig().setBootstrapUrls(bootstrapUrl));

	StoreClient<String, String> client = factory.getStoreClient (storeName);

	voldemort_manipulate.dict_to_voldemort_proc (dict_aa,client);

	System.out.println ("***** 終了 *****");
}

// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3051","和歌山",51276,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3052","海南",43842,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3053","橋本",98253,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3054","有田",87624,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3055","御坊",72531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3056","田辺",28529,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3057","新宮",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3058","紀の川",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3059","岩出",56872,"2008-10-24");

	return	dict_aa;
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
