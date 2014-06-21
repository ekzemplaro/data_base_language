// -------------------------------------------------------------------
//	mcached_create.vala
//
//					Feb/07/2014
//
// -------------------------------------------------------------------
using GLib;
using Json;

// -------------------------------------------------------------------
static int main (string[] args)
{
	stdout.printf ("*** 開始 ***\n");

	HashTable <string,HashTable <string,string>> dict_aa
		= data_prepare_proc ();

	string hostname = "localhost";
	var port = 11211;

	dict_to_mcached_proc (hostname,port,dict_aa);

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
	dict_aa = dict_append_proc (dict_aa,"t1731","金沢",31946,"1923-12-16");
	dict_aa = dict_append_proc (dict_aa,"t1732","輪島",37452,"1923-9-8");
	dict_aa = dict_append_proc (dict_aa,"t1733","小松",65123,"1923-8-21");
	dict_aa = dict_append_proc (dict_aa,"t1734","七尾",21452,"1923-1-12");
	dict_aa = dict_append_proc (dict_aa,"t1735","珠洲",58169,"1923-7-18");
	dict_aa = dict_append_proc (dict_aa,"t1736","加賀",93427,"1923-8-13");
	dict_aa = dict_append_proc (dict_aa,"t1737","羽咋",18736,"1923-5-5");
	dict_aa = dict_append_proc (dict_aa,"t1738","かほく",34892,"1923-2-22");
	dict_aa = dict_append_proc (dict_aa,"t1739","白山",69721,"1923-12-3");

	return	dict_aa;
}

// -------------------------------------------------------------------
static void dict_to_mcached_proc
	(string hostname,uint16 port,
	HashTable <string,HashTable <string,string>> dict_aa)
{
	
	foreach(string key in dict_aa.get_keys ())
		{
		HashTable <string,string> unit_aa = dict_aa.lookup (key);
		string name = unit_aa.lookup ("name");
		string population = unit_aa.lookup ("population");
		string date_mod = unit_aa.lookup ("date_mod");

		stdout.printf (key + "\t");
//		stdout.printf (name + "\t");
//		stdout.printf (population + "\t");
//		stdout.printf (date_mod + "\n");

		string json_str = to_json_proc (name,population,date_mod);
		stdout.printf (json_str + "\n");

		mcached_put_proc (hostname,port,key,json_str);
		}
}

// -------------------------------------------------------------------
