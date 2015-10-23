// ------------------------------------------------------------------
//	hgdb_create.java
//
//					Feb/01/2012
// ------------------------------------------------------------------
import	java.util.HashMap;
// ------------------------------------------------------------------
public class hgdb_create
{

// ------------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	String databaseLocation = args[0];

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	hgdb_manipulate.dict_to_hgdb_proc (dict_aa,databaseLocation);

	System.out.println ("*** 終了 ***");
}

// ------------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4471","大分",76931,"2008-12-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4472","別府",43842,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4473","中津",98253,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4474","日田",87624,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4475","佐伯",72531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4476","臼杵",28529,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4477","津久見",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4478","竹田",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4479","豊後高田",68729,"2008-10-24");

	return	dict_aa;
}
// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
