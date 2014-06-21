#! /usr/bin/pike
//
//	postgre_read.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/sql_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	object db = Sql.pgsql ("localhost", "city", "scott", "tiger");

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
