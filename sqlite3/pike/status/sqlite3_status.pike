#! /usr/bin/pike
//
//	sqlite3_status.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
int main ()
{
	write ("*** 開始 ***\n");

//	object db = Sql.sqlite ("sqlite://", "/var/tmp/sqlite3/cities.db");
//	object db = Sql.sqlite ("sqlite:/var/tmp/sqlite3/cities.db");
	object db = Sql.sqlite ("/var/tmp/sqlite3/cities.db");

//	write (db->host_info ());
//	write ("\n");
	write (db->server_info ());
	write ("\n");
//	write ((string)db->protocol_info ());
//	write ("\n");
//	write (db->statistics ());
//	write ("\n\n");
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
