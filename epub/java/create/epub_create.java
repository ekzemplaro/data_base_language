// ----------------------------------------------------------
/*
	epub_create.java

						Sep/17/2014
*/
// ----------------------------------------------------------
import	java.util.HashMap;

import java.io.FileOutputStream;

// ----------------------------------------------------------
public class epub_create
{

// ----------------------------------------------------------
public static void main(String[] args)
{
	System.out.println ("*** 開始 ***");

	String epub_file = args[0];

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	epub_manipulate.dict_to_epub_proc (epub_file,dict_aa);

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1931","甲府",51376,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1932","富士吉田",49182,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1933","都留",93157,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1934","山梨",89124,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1935","大月",75631,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1936","韮崎",28579,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1937","南アルプス",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1938","北杜",48362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1939","甲斐",54813,"2008-10-24");

	return	dict_aa;
}

// ----------------------------------------------------------
}
// ----------------------------------------------------------
