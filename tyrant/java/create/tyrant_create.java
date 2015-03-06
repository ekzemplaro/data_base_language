// --------------------------------------------------------------
//	tyrant_create.java
//
//					Feb/16/2015
// --------------------------------------------------------------
import	java.util.HashMap;
import	java.util.Set;

 
// --------------------------------------------------------------
public class tyrant_create{
 
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");
	
	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	final String server = "host_ubuntu1";
	final int port = 1978;

	mcached_socket.dict_to_mcached_proc (server,port,dict_aa);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4761","那覇",27189,"2008-5-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4762","宜野湾",49512,"2008-9-21");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4763","石垣",82753,"2008-3-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4764","浦添",79624,"2008-2-18");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4765","名護",62539,"2008-10-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4766","糸満",28714,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4767","沖縄",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4768","豊見城",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4769","うるま",51872,"2008-10-24");

	return	dict_aa;
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
