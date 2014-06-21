#! /usr/bin/pike
//
//	mcachedb_update.pike
//
//						Aug/27/2013
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
#include "/var/www/data_base/common/pike_common/mcached_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string key = argv[1];
	string population_in = argv[2];

	write (key + "\t");
	write (population_in + "\n");

	int port = 21201;

	object con = File();
	con->connect("127.0.0.1",port);

	con_update_proc (con,key,population_in);
 
	con->close();
 
	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
