#! /usr/bin/pike
//
//	redis_update.pike
//
//						Aug/27/2013
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
#include "/var/www/data_base/common/pike_common/redis_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string key = argv[1];
	string population_in = argv[2];

	write (key + "\t");
	write (population_in + "\n");

	string host = "host_dbase";

	int port = 6379;

	object con = File();
	con->connect(host,port);

	redis_update_proc (con,key,population_in);
 
	con->close();
 
	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
