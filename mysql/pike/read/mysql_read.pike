#! /usr/bin/pike
//
//	mysql_read.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/sql_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	object db = Mysql.mysql ("host_mysql", "city", "scott", "tiger");

	object res_aa = db->big_query ("SET NAMES utf8");

	string sql_command = "select * from cities";

	object res = db->big_query (sql_command);
	write ("num_rows = " + (string)res.num_rows () + "\n");
	write ("num_fields = " + (string)res.num_fields () + "\n");

	show_rows_proc_mysql (res);

	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
