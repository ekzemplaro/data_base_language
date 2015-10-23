// -----------------------------------------------------------------------
/*
	json_create.java

					Jan/26/2012
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;

// -----------------------------------------------------------------------
public class json_create
{

// -----------------------------------------------------------------------
public	static void main (String [] args)
{
	System.out.println ("*** 開始 ***");

	String json_file = args[0];

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	text_manipulate.dict_display_proc (dict_aa);

	String json_str = json_manipulate.dict_to_json_proc (dict_aa);

	file_io.file_write_proc (json_file,json_str);

	System.out.println ("*** 終了 ***");
}

// -----------------------------------------------------------------------
static HashMap <String, HashMap <String,String>> data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0921","宇都宮",19825,"2008-2-12");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0922","小山",35749,"2008-10-14");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0923","佐野",49128,"2008-4-9");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0924","足利",85972,"2008-3-21");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0925","日光",64152,"2008-7-25");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0926","下野",85793,"2008-10-9");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0927","さくら",73164,"2008-2-11");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0928","矢板",65237,"2008-5-27");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0929","真岡",28754,"2008-1-5");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0930","栃木",79571,"2008-7-4");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0931","大田原",36952,"2008-9-27");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0932","鹿沼",42316,"2008-10-24");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0933","那須塩原",64753,"2008-12-17");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0934","那須烏山",71298,"2008-11-15");

	return	dict_aa;
}

// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
