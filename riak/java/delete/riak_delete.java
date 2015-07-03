// --------------------------------------------------------------
//	delete/riak_delete.java
//
//					Jun/25/2015
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class riak_delete
{

// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key_in = args[0];

	System.out.println ("\tkey_in = " + key_in);

	String url_target= "http://host_ubuntu1:8098/riak/shimane/" + key_in;

	get_uri.rest_delete_proc (url_target);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
