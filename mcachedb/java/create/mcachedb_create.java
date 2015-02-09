// --------------------------------------------------------------
//	create/mcachedb_create.java
//
//					Feb/04/2015
// --------------------------------------------------------------
import	java.util.HashMap;

// --------------------------------------------------------------
public class mcachedb_create{
 
// --------------------------------------------------------------
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
			dict_aa = data_prepare_proc (); 

	final String server = "host_ubuntu1";
	final int port = 21201;

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
		(dict_aa,"t1521","新潟",38459,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1522","長岡",43172,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1523","新発田",91653,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1524","上越",87124,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1525","糸魚川",72538,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1526","加茂",21579,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1527","三条",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1528","佐渡",47361,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1529","柏崎",51872,"2008-10-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1530","村上",89416,"2008-2-7");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1531","十日町",39451,"2008-9-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1532","五泉",72846,"2008-4-9");


	return	dict_aa;
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
