#! /usr/bin/pike
//
//	postgre_update.pike
//
//						Aug/27/2013
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string key = argv[1];
	string population_in = argv[2];

	write (key + "\t");
	write (population_in + "\n");

	object db = Sql.pgsql ("localhost", "city", "scott", "tiger");

	string today = get_current_date_proc ();

	string sql_command = "update cities set population=" + population_in
		+ ", date_mod ='" + today + "' where ID='" + key + "'";

	object res = db->big_query (sql_command);
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
