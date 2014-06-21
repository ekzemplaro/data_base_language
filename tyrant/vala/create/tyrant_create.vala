// -------------------------------------------------------------------
//	tyrant_create.vala
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
	var port = 1978;

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
	dict_aa = dict_append_proc (dict_aa,"t4761","那覇",94651,"1923-11-14");
	dict_aa = dict_append_proc (dict_aa,"t4762","宜野湾",49526,"1923-3-7");
	dict_aa = dict_append_proc (dict_aa,"t4763","石垣",52398,"1923-5-25");
	dict_aa = dict_append_proc (dict_aa,"t4764","浦添",21452,"1923-2-18");
	dict_aa = dict_append_proc (dict_aa,"t4765","名護",58169,"1923-8-21");
	dict_aa = dict_append_proc (dict_aa,"t4766","糸満",93427,"1923-8-13");
	dict_aa = dict_append_proc (dict_aa,"t4767","沖縄",18736,"1923-5-5");
	dict_aa = dict_append_proc (dict_aa,"t4768","豊見城",34892,"1923-2-22");
	dict_aa = dict_append_proc (dict_aa,"t4769","うるま",69721,"1923-12-3");

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
