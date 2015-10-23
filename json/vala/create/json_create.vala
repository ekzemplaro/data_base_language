// -------------------------------------------------------------------
//	json_create.vala
//
//					Oct/22/2014
//
//	text_manipulate
// -------------------------------------------------------------------
using GLib;
using Json;

// -------------------------------------------------------------------
static int main (string[] args)
{
	stdout.printf ("*** 開始 ***\n");
	stdout.printf (args[1] + "\n");

	var file_out = args[1];

	HashTable <string,HashTable <string,string>> dict_aa
		= data_prepare_proc ();

	var file_stream = FileStream.open (file_out,"w");

	var out_str = dict_to_json_str_proc (dict_aa);


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

	dict_aa = dict_append_proc (dict_aa,"t0921","宇都宮",38945,"1923-6-24");
	dict_aa = dict_append_proc (dict_aa,"t0922","小山",21734,"1923-3-7");
	dict_aa = dict_append_proc (dict_aa,"t0923","佐野",69583,"1923-9-21");
	dict_aa = dict_append_proc (dict_aa,"t0924","足利",74192,"1923-3-12");
	dict_aa = dict_append_proc (dict_aa,"t0925","日光",57628,"1923-7-18");
	dict_aa = dict_append_proc (dict_aa,"t0926","下野",92137,"1923-8-13");
	dict_aa = dict_append_proc (dict_aa,"t0927","さくら",12536,"1923-1-5");
	dict_aa = dict_append_proc (dict_aa,"t0928","矢板",39462,"1923-2-22");
	dict_aa = dict_append_proc (dict_aa,"t0929","真岡",67841,"1923-5-23");
	dict_aa = dict_append_proc (dict_aa,"t0930","栃木",39245,"1923-12-11");
	dict_aa = dict_append_proc (dict_aa,"t0931","大田原",75386,"1923-5-15");
	dict_aa = dict_append_proc (dict_aa,"t0932","鹿沼",85231,"1923-8-26");
	dict_aa = dict_append_proc (dict_aa,"t0933","那須塩原",64582,"1923-7-23");
	dict_aa = dict_append_proc (dict_aa,"t0934","那須烏山",41378,"1923-3-18");
	return	dict_aa;
}
// -------------------------------------------------------------------
static string dict_to_json_str_proc (HashTable <string,HashTable <string,string>> dict_aa)
{
	var out_str = "{";

	foreach(string key in dict_aa.get_keys ())
		{
		HashTable <string,string> unit_aa = dict_aa.lookup (key);

		out_str += record_out_proc (key,unit_aa);
		}

	var llx = out_str.length;

	out_str = out_str.substring (0,llx-2) + "}";

	return	out_str;
}

// -------------------------------------------------------------------
static string record_out_proc
	(string key,HashTable <string,string> unit_aa)
{
		string name = unit_aa.lookup ("name");
		string population = unit_aa.lookup ("population");
		string date_mod = unit_aa.lookup ("date_mod");

	var gen = new Generator();
	var root = new Json.Node(NodeType.OBJECT);
	var object = new Json.Object();
	root.set_object(object);
	gen.set_root(root);

	object.set_string_member ("name",name);
	object.set_string_member ("population",population);
	object.set_string_member ("date_mod",date_mod);

	size_t length;
	string json;

	json = gen.to_data(out length);

//	stdout.printf (json + "\n");

	var out_str = "\"" + key + "\": " + json + ",\n";

	return	out_str;
}

// -------------------------------------------------------------------
