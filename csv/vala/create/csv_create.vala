// -------------------------------------------------------------------
//	text_create.vala
//
//					Jun/06/2011
//
// -------------------------------------------------------------------
using GLib;

// -------------------------------------------------------------------
static int main (string[] args)
{
	stdout.printf ("*** 開始 ***\n");
	stdout.printf (args[1] + "\n");

	var file_out = args[1];

	stdout.printf ("*** pppp ***\n");
	HashTable <string,HashTable <string,string>> dict_aa
		= data_prepare_proc ();

	stdout.printf ("*** qqqq ***\n");
	csv_write_proc (file_out,dict_aa);

	stdout.printf ("*** 終了 ***\n");

	return 0;
}

// -------------------------------------------------------------------
static HashTable <string,HashTable <string,string>>
	data_prepare_proc ()
{
	HashTable <string,HashTable <string,string>> dict_aa = new
	HashTable <string,HashTable <string,string>> (str_hash,str_equal);

	stdout.printf ("*** data_prepare_proc *** aaaa ***\n");
	dict_aa = dict_append_proc (dict_aa,"t1271","千葉",92315,"1987-10-14");
	stdout.printf ("*** data_prepare_proc *** bbbb ***\n");
	dict_aa = dict_append_proc (dict_aa,"t1272","勝浦",72737,"1987-5-8");
	dict_aa = dict_append_proc (dict_aa,"t1273","市原",62823,"1987-9-21");
	dict_aa = dict_append_proc (dict_aa,"t1274","流山",45281,"1987-3-12");
	dict_aa = dict_append_proc (dict_aa,"t1275","八千代",52168,"1987-7-18");
	dict_aa = dict_append_proc (dict_aa,"t1276","我孫子",92427,"1987-8-13");
	dict_aa = dict_append_proc (dict_aa,"t1277","鴨川",12786,"1987-1-5");
	dict_aa = dict_append_proc (dict_aa,"t1278","銚子",32492,"1987-2-22");
	dict_aa = dict_append_proc (dict_aa,"t1279","市川",62971,"1987-10-3");

	return	dict_aa;
}

// -------------------------------------------------------------------
