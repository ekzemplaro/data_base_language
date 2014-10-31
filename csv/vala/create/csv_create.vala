// -------------------------------------------------------------------
//	csv_create.vala
//
//					Oct/22/2014
//
// -------------------------------------------------------------------
using GLib;

// -------------------------------------------------------------------
static int main (string[] args)
{
	stdout.printf ("*** 開始 ***\n");
	stdout.printf (args[1] + "\n");

	var file_out = args[1];

	HashTable <string,HashTable <string,string>> dict_aa
		= data_prepare_proc ();

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

	dict_aa = dict_append_proc (dict_aa,"t1271","千葉",98315,"1923-10-14");
	dict_aa = dict_append_proc (dict_aa,"t1272","勝浦",59137,"1923-5-8");
	dict_aa = dict_append_proc (dict_aa,"t1273","市原",68913,"1923-9-21");
	dict_aa = dict_append_proc (dict_aa,"t1274","流山",45381,"1923-3-12");
	dict_aa = dict_append_proc (dict_aa,"t1275","八千代",52168,"1923-7-18");
	dict_aa = dict_append_proc (dict_aa,"t1276","我孫子",93427,"1923-8-13");
	dict_aa = dict_append_proc (dict_aa,"t1277","鴨川",14786,"1923-1-5");
	dict_aa = dict_append_proc (dict_aa,"t1278","銚子",37492,"1923-2-22");
	dict_aa = dict_append_proc (dict_aa,"t1279","市川",62371,"1923-10-3");

	return	dict_aa;
}

// -------------------------------------------------------------------
