// --------------------------------------------------------------
//	create/mcached_create.java
//
//					Feb/04/2015
// --------------------------------------------------------------
import	java.util.HashMap; 

// --------------------------------------------------------------
public class mcached_create
{
 
// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
			dict_aa = data_prepare_proc (); 

	final String server = "localhost";
	final int port = 11211;

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
		(dict_aa,"t1731","金沢",67139,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1732","輪島",53872,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1733","小松",71653,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1734","七尾",37124,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1735","珠洲",72538,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1736","加賀",21579,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1737","羽咋",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1738","かほく",47361,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1739","白山",51872,"2008-10-24");

	return	dict_aa;
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
