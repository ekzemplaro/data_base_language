#! /usr/bin/pike
//
//	sqlite3_read.pike
//
//						Aug/27/2013
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/sql_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string file_sqlite = argv[1];

	write (file_sqlite + "\n");

//	object db = Sql.sqlite ("sqlite://" + file_sqlite);
	Sql.sql db = Sql.sql ("sqlite://" + file_sqlite);

	string sql_command = "select * from cities";

	object res = db->big_query (sql_command);


	write ("num_rows = " + (string)res.index + "\n");
//	write ("num_rows = " + (string)res.num_rows () + "\n");
//	write ("num_fields = " + (string)res.num_fields () + "\n");

	show_rows_proc (res);

	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
