// -----------------------------------------------------------------------
/*
	csv_create.java


					Jul/11/2011
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;

// -----------------------------------------------------------------------
public class csv_create
{

// -----------------------------------------------------------------------
public	static void main (String [] args)
{
	System.out.println ("*** 開始 ***");

	String text_file = args[0];

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	text_manipulate.dict_display_proc (dict_aa);

	text_manipulate.csv_write_proc (text_file,dict_aa);


	System.out.println ("*** 終了 ***");
}

// -----------------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1271","千葉",51276,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1272","勝浦",49172,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1273","市原",92153,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1274","流山",89243,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1275","八千代",72185,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1276","我孫子",28529,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1277","鴨川",39467,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1278","銚子",47361,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1279","市川",56743,"2008-10-24");

	return	dict_aa;
}

// -----------------------------------------------------------------------
}

// -----------------------------------------------------------------------
