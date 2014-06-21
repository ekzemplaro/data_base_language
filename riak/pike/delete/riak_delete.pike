#! /usr/bin/pike
//
//	riak_delete.pike
//
//						Aug/30/2013
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string key = argv[1];

	write (key + "\n");

	string url_shimane = "http://localhost:8098/riak/shimane";
	string url_target = url_shimane + "/" + key;

	object resp=Protocols.HTTP.delete_url (url_target);
 
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
