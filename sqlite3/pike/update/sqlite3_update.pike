#! /usr/bin/pike
//
//	sqlite3_update.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string file_sqlite = argv[1];
	string key = argv[2];
	string population_in = argv[3];

	write (key + "\t");
	write (population_in + "\n");

	object db = Sql.sqlite (file_sqlite);

	mapping(string:int) ttx = localtime (time ());

	string today = sprintf("%d-%d-%d",
		ttx["year"] + 1900,ttx["mon"] + 1,ttx["mday"]);

	string sql_command = "update cities set population=" + population_in
		+ ", date_mod ='" + today + "' where ID='" + key + "'";

	object res = db->big_query (sql_command);
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
