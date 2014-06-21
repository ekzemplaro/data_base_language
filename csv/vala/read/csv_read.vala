// -------------------------------------------------------------------
//	csv_read.vala
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

	var file_in = args[1];

	HashTable <string,HashTable <string,string>> dict_aa =
		csv_read_proc (file_in);

	dict_display_proc (dict_aa);

	stdout.printf ("*** 終了 ***\n");

	return 0;
}

// -------------------------------------------------------------------
