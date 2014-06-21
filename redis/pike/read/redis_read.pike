#! /usr/bin/pike
//
//	redis_read.pike
//
//						Aug/27/2013
//
// ----------------------------------------------------------------
import Stdio;

#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
#include "/var/www/data_base/common/pike_common/redis_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	mapping(string:mapping(string:string)) dict_aa
		=  redis_to_dict_proc ("host_dbase");

	dict_display_proc (dict_aa);

	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
