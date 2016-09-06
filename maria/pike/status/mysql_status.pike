#! /usr/bin/pike
//
//	mysql_status.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
int main ()
{
	write ("*** 開始 ***\n");

	object db = Sql.mysql ("host_mysql", "city", "scott", "tiger");

	write (db->host_info ());
	write ("\n");
	write (db->server_info ());
	write ("\n");
	write ((string)db->protocol_info ());
	write ("\n");
	write (db->statistics ());
	write ("\n\n");
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
