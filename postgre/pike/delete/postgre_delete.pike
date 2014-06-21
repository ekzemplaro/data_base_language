#! /usr/bin/pike
//
//	mysql_delete.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string key = argv[1];

	write (key + "\n");

	object db = Sql.pgsql ("localhost", "city", "scott", "tiger");

	string sql_command = "delete from cities where ID='" + key + "'";
	object res = db->big_query (sql_command);
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
