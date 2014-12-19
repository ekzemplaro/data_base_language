// --------------------------------------------------------------
//	xlsx_create.java
//
//					Dec/12/2014
// --------------------------------------------------------------
import	java.io.IOException;
import	java.util.HashMap;

// --------------------------------------------------------------
public class xlsx_create
{
// --------------------------------------------------------------
public static void main (String[] args) throws IOException
{
	System.out.println ("*** 開始 ***");

	String xlsx_file = args[0];  
 
	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	xlsx_manipulate.xlsx_write_proc (xlsx_file,dict_aa);

	System.out.println ("*** 終了 ***");
}
// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2971","奈良",361824,"2008-10-17");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2972","大和高田",298517,"2008-9-21");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2973","大和郡山",916534,"2008-6-20");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2974","天理",849127,"2008-2-17");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2975","橿原",735428,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2976","桜井",275369,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2977","五條",395467,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2978","御所",147362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2979","生駒",567214,"2008-10-24");

	return	dict_aa;
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------
