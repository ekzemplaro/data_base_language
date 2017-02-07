// -----------------------------------------------------------------
/*
	pdf_create.java

				Jan/07/2012

*/
// -----------------------------------------------------------------
import	java.util.HashMap;
//
// -----------------------------------------------------------------
public	class	pdf_create
{
// -----------------------------------------------------------------
public	static void main (String [] args)
{
	System.out.println  ("*** 開始 ***");

	String pdf_file = args[0];

	HashMap <String, HashMap <String,String>> dict_aa
		= data_prepare_proc ();

	pdf_manipulate.dict_to_pdf_proc (dict_aa,pdf_file);

	System.out.println  ("*** 終了 ***");
}

// -----------------------------------------------------------------
static HashMap <String, HashMap <String,String>> data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2531","大津",35276,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2532","草津",79142,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2533","守山",37856,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2534","栗東",89524,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2535","野洲",72638,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2536","甲賀",28529,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2537","湖南",39451,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2538","近江八幡",47365,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t2539","彦根",56874,"2008-10-24");

	return	dict_aa;
}

// -----------------------------------------------------------------
}

// -----------------------------------------------------------------
