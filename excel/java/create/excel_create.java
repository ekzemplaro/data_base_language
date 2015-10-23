// ----------------------------------------------------------------
/*
	excel_create.java
					Jul/05/2011

*/
// ----------------------------------------------------------------
import java.io.File;
import java.io.IOException;
import java.util.Date;  
import jxl.write.WriteException;

import	java.util.HashMap;
import	java.util.Set;
// ----------------------------------------------------------------
public class excel_create
{
// ----------------------------------------------------------------
public static void main (String[] args)
	throws IOException,WriteException
{ 
	System.out.println ("*** 開始 ***");

	String excel_file = args[0];  
 
	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	text_manipulate.dict_display_proc (dict_aa);

	excel_manipulate.excel_write_proc (excel_file,dict_aa); 

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2971","奈良",51274,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2972","大和高田",49132,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2973","大和郡山",91534,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2974","天理",89127,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2975","橿原",72428,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2976","桜井",25329,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2977","五條",39467,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2978","御所",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2979","生駒",56724,"2008-10-24");

	return	dict_aa;
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
