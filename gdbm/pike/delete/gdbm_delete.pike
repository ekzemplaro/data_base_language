#! /usr/bin/pike
//
//	gdbm_delete.pike
//
//						Aug/26/2013
//
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string file_gdbm = argv[1];
	string key_in = argv[2];

	write (key_in + "\n");

	object db = Gdbm.gdbm (file_gdbm,"rw");

	db->delete (key_in);

	db->close ();

	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
