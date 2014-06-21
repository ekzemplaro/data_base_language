// -------------------------------------------------------------------
//	xml_create.vala
//
//					Aug/28/2011
//
//		text_manipulate
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

	var out_str = dict_to_xml_str_proc (dict_aa);

	var file_stream = FileStream.open (file_out,"w");
	file_stream.puts (out_str);

	stdout.printf ("*** 終了 ***\n");

	return 0;
}

// -------------------------------------------------------------------
static HashTable <string,HashTable <string,string>>
	data_prepare_proc ()
{
	HashTable <string,HashTable <string,string>> dict_aa = new
	HashTable <string,HashTable <string,string>> (str_hash,str_equal);

	dict_aa = dict_append_proc (dict_aa,"t2261","静岡",89516,"1923-9-24");
	dict_aa = dict_append_proc (dict_aa,"t2262","浜松",23174,"1923-3-7");
	dict_aa = dict_append_proc (dict_aa,"t2263","沼津",69483,"1923-9-21");
	dict_aa = dict_append_proc (dict_aa,"t2264","三島",28619,"1923-3-12");
	dict_aa = dict_append_proc (dict_aa,"t2265","富士",51438,"1923-7-18");
	dict_aa = dict_append_proc (dict_aa,"t2266","熱海",94867,"1923-8-13");
	dict_aa = dict_append_proc (dict_aa,"t2267","富士宮",12756,"1923-1-5");
	dict_aa = dict_append_proc (dict_aa,"t2268","藤枝",32943,"1923-2-22");
	dict_aa = dict_append_proc (dict_aa,"t2269","御殿場",62531,"1923-5-23");
	dict_aa = dict_append_proc (dict_aa,"t2270","島田",35867,"1923-12-11");


	return	dict_aa;
}
// -------------------------------------------------------------------
static string dict_to_xml_str_proc (HashTable <string,HashTable <string,string>> dict_aa)
{
	var out_str = "<?xml version=\"1.0\" encoding=\"utf-8\"?><root>\n";


	foreach(string key in dict_aa.get_keys ())
		{
		HashTable <string,string> unit_aa = dict_aa.lookup (key);
		string name = unit_aa.lookup ("name");
		string population = unit_aa.lookup ("population");
		string date_mod = unit_aa.lookup ("date_mod");

		out_str += record_out_proc (key,name,population,date_mod);
		}
	out_str += "</root>";

	return (out_str);
}

// -------------------------------------------------------------------
static string record_out_proc
	(string id,string name,string population,string date_mod)
{
	var out_str = "<" + id + ">";
	out_str += "<name>" + name + "</name>";
	out_str += "<population>" + population + "</population>";
	out_str += "<date_mod>" + date_mod + "</date_mod>";
	out_str += "</" + id + ">\n";

	return (out_str);
}

// -------------------------------------------------------------------
