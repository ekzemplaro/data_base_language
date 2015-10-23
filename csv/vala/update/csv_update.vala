// -------------------------------------------------------------------
//	csv_update.vala
//
//					Jun/06/2011
//
// -------------------------------------------------------------------
using GLib;

// -------------------------------------------------------------------
static int main (string[] args)
{
	stdout.printf ("*** 開始 ***\n");

	var file_text = args[1];
	var id_in = args[2];
	var population_in = args[3];
	stdout.printf (file_text + "\t");
	stdout.printf (id_in + "\t");
	stdout.printf (population_in + "\n");

	HashTable <string,HashTable <string,string>> dict_aa
			=  csv_read_proc (file_text);

	dict_aa =  dict_update_proc (dict_aa,id_in,population_in);

	csv_write_proc (file_text,dict_aa);

	stdout.printf ("*** 終了 ***\n");

	return 0;
}

// -------------------------------------------------------------------
