#! /usr/bin/pike
//
//	sqlite3_delete.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string file_sqlite = argv[1];
	string key = argv[2];

	write (key + "\n");

	object db = Sql.sqlite (file_sqlite);

	string sql_command = "delete from cities where ID='" + key + "'";
	object res = db->big_query (sql_command);
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
