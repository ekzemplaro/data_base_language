#! /usr/bin/pike
//
//	tyrant_read.pike
//
//						Aug/27/2013
//
// ----------------------------------------------------------------
import Stdio;

#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
#include "/var/www/data_base/common/pike_common/mcached_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	int port = 1978;

	array aa = ({"t4761","t4762","t4763",
		"t4764","t4765","t4766",
		"t4767","t4768","t4769"});

	mapping(string:mapping(string:string)) dict_aa
			= port_to_dict_proc (port,aa);

	dict_display_proc (dict_aa);

	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
