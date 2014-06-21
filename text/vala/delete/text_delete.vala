// -------------------------------------------------------------------
//	text_delete.vala
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
	stdout.printf (file_text + "\t");
	stdout.printf (id_in + "\n");

	HashTable <string,HashTable <string,string>> dict_aa
			=  text_read_proc (file_text);


	dict_aa.remove (id_in);

	text_write_proc (file_text,dict_aa);

	stdout.printf ("*** 終了 ***\n");

	return 0;
}

// -------------------------------------------------------------------
