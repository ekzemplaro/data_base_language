#! /usr/bin/pike
//
//	mcached_read.pike
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

	int port = 11211;

	array aa = ({"t1731","t1732","t1733",
		"t1734","t1735","t1736",
		"t1737","t1738","t1739"});

	mapping(string:mapping(string:string)) dict_aa
			= port_to_dict_proc (port,aa);

	dict_display_proc (dict_aa);

	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
