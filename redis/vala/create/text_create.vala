// -------------------------------------------------------------------
//	text_create.vala
//
//					Oct/26/2011
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
	text_write_proc (file_out,dict_aa);

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
	dict_aa = dict_append_proc (dict_aa,"t2381","名古屋",31546,"1923-10-14");
	stdout.printf ("*** data_prepare_proc *** bbbb ***\n");
	dict_aa = dict_append_proc (dict_aa,"t2382","豊橋",37852,"1923-5-8");
	dict_aa = dict_append_proc (dict_aa,"t2383","岡崎",65823,"1923-10-21");
	dict_aa = dict_append_proc (dict_aa,"t2384","一宮",21452,"1923-3-12");
	dict_aa = dict_append_proc (dict_aa,"t2385","蒲郡",58169,"1923-7-18");
	dict_aa = dict_append_proc (dict_aa,"t2386","常滑",92427,"1923-8-13");
	dict_aa = dict_append_proc (dict_aa,"t2387","大府",18736,"1923-1-5");
	dict_aa = dict_append_proc (dict_aa,"t2388","瀬戸",34392,"1923-2-22");
	dict_aa = dict_append_proc (dict_aa,"t2389","犬山",69521,"1923-12-3");

	return	dict_aa;
}

// -------------------------------------------------------------------
