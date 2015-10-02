// --------------------------------------------------------------
/*
	create/riak_create.java

				Sep/22/2015

*/
// --------------------------------------------------------------
import java.util.HashMap;
import java.util.Set;

import  net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class riak_create
{

// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();


//	final String url_base = "http://host_ubuntu:8098/riak/shimane";
	final String url_base = "http://cddn007-ee:8098/riak/shimane";

	Set set_aaa = dict_aa.keySet ();

	for (Object key_aa: set_aaa)
		{
		HashMap <String,String> dict_city = dict_aa.get (key_aa);
		System.out.print (key_aa + "\t");
		System.out.print (dict_city.get ("name") + "\t");
		Object ppx = dict_city.get ("population");
		System.out.print (ppx + "\t");

		System.out.println (dict_city.get ("date_mod"));

		String str_json_out = JSON.encode (dict_city);
		String url_target = url_base + "/" + key_aa;
		get_uri.rest_put_proc (url_target,str_json_out,"text/json");
		}
	System.out.println("*** 終了 ***");
}
 
// --------------------------------------------------------------
static HashMap <String, HashMap<String,String>> data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3251","松江",42651,"2008-4-18");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3252","出雲",71386,"2008-3-24");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3253","大田",87521,"2008-10-7");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3254","雲南",19256,"2008-3-21");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3255","江津",67392,"2008-5-25");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3256","浜田",85476,"2008-9-9");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3257","益田",64279,"2008-12-11");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t3258","安来",63984,"2008-5-27");

	return	dict_aa;
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
