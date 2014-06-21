// -------------------------------------------------------------------
//	text_manipulate.vala
//
//					Jun/06/2011
//
// -------------------------------------------------------------------
using GLib;

// -------------------------------------------------------------------
static HashTable <string,HashTable <string,string>>
	text_read_proc (string file_in)
{
	string delimit = "\t";

	HashTable <string,HashTable <string,string>> dict_aa
		= text_read_proc_exec (file_in,delimit);

	return	dict_aa;
}

// -------------------------------------------------------------------
static HashTable <string,HashTable <string,string>>
	text_read_proc_exec (string file_in,string delimit)
{
	HashTable <string,HashTable <string,string>> dict_aa = new
	HashTable <string,HashTable <string,string>> (str_hash,str_equal);
//	HashTable <string,HashTable <string,string>> (str_hash,direct_equal);

	var file = File.new_for_path (file_in);

	if (!file.query_exists (null)) {
		stderr.printf ("File '%s' doesn't exist.\n", file.get_path ());
//		return 1;
		}

	try {
		var in_stream = new DataInputStream (file.read (null));
		string line;
		while ((line = in_stream.read_line (null, null)) != null)
		{
		var ddx=line.split (delimit);

	HashTable <string,string> unit_aa
		= new HashTable <string,string> (str_hash,str_equal);

		unit_aa.insert ("name",ddx[1]);
		unit_aa.insert ("population",ddx[2]);
		unit_aa.insert ("date_mod",ddx[3]);

		dict_aa.insert (ddx[0],unit_aa);
		}

	} catch (Error ee) {
			error ("%s", ee.message);
    		}

	return	dict_aa;
}

// -------------------------------------------------------------------
static void dict_display_proc
	(HashTable <string,HashTable <string,string>> dict_aa)
{
	foreach(string key in dict_aa.get_keys ())
		{
		HashTable <string,string> unit_aa = dict_aa.lookup (key);
		string name = unit_aa.lookup ("name");
		string population = unit_aa.lookup ("population");
		string date_mod = unit_aa.lookup ("date_mod");

		stdout.printf (key + "\t");
		stdout.printf (name + "\t");
		stdout.printf (population + "\t");
		stdout.printf (date_mod + "\n");
		}
}

// -------------------------------------------------------------------
static HashTable <string,HashTable <string,string>>
	dict_update_proc
	(HashTable <string,HashTable <string,string>> dict_aa,
	string id_in,string population_in)
{
	HashTable <string,string> unit_aa
		= dict_aa.lookup (id_in);


	var today = GLib.Time.local (time_t ()).to_string ();

	unit_aa.insert ("population",population_in);
	unit_aa.insert ("date_mod",today);

	dict_aa.insert (id_in,unit_aa);

	return dict_aa;
}

// -------------------------------------------------------------------
static void text_write_proc (string file_out,
	HashTable <string,HashTable <string,string>> dict_aa)
{
	string delimit = "\t";

	text_write_proc_exec (file_out,dict_aa,delimit);
}

// -------------------------------------------------------------------
static void text_write_proc_exec (string file_out,
	HashTable <string,HashTable <string,string>> dict_aa,string delimit)
{
	var file_stream = FileStream.open (file_out,"w");

	foreach (string key in dict_aa.get_keys ())
		{
		HashTable <string,string> unit_aa = dict_aa.lookup (key);

		string name = unit_aa.lookup ("name");
		string population = unit_aa.lookup ("population");
		string date_mod = unit_aa.lookup ("date_mod");

		stdout.printf ("%s\n",key);

		var line_out = key + delimit;
		line_out += name + delimit;
		line_out += population + delimit;
		line_out += date_mod + "\n";
		file_stream.puts (line_out);
		}
}

// -------------------------------------------------------------------
static HashTable <string,HashTable <string,string>>
	dict_append_proc (HashTable <string,HashTable <string,string>> dict_aa,
		string id_in,string name,int population,string date_mod)
{
	HashTable <string,string> unit_aa
		= new HashTable <string,string> (str_hash,str_equal);

	unit_aa.insert ("name",name);
	unit_aa.insert ("population","%d".printf (population));
	unit_aa.insert ("date_mod",date_mod);

	dict_aa.insert (id_in,unit_aa);

	return	dict_aa;
}

// -------------------------------------------------------------------
static HashTable <string,HashTable <string,string>>
	csv_read_proc (string file_in)
{
	string delimit = ",";

	HashTable <string,HashTable <string,string>> dict_aa
		= text_read_proc_exec (file_in,delimit);

	return	dict_aa;
}

// -------------------------------------------------------------------
static void csv_write_proc (string file_out,
	HashTable <string,HashTable <string,string>> dict_aa)
{
	string delimit = ",";

	text_write_proc_exec (file_out,dict_aa,delimit);
}

// -------------------------------------------------------------------
