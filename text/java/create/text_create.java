// -----------------------------------------------------------------------
/*
	text_create.java


					Sep/05/2016
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;

// -----------------------------------------------------------------------
public class text_create
{

// -----------------------------------------------------------------------
public	static void main (String [] args)
{
	System.err.println ("*** 開始 ***");

	String text_file = args[0];

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	text_manipulate.text_write_proc (text_file,dict_aa);

	System.err.println ("*** 終了 ***");
}

// -----------------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2381","名古屋",51276,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2382","豊橋",73849,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2383","岡崎",98253,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2384","一宮",87624,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2385","蒲郡",72531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2386","常滑",28539,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2387","大府",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2388","瀬戸",47365,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2389","犬山",56874,"2008-10-24");

	return	dict_aa;
}

// -----------------------------------------------------------------------
}

// -----------------------------------------------------------------------
