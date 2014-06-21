#! /usr/bin/pike
//
//	mcachedb_read.pike
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

	int port = 21201;

	array aa = ({"t1521","t1522","t1523",
		"t1524","t1525","t1526",
		"t1527","t1528","t1529",
		"t1530","t1531","t1532"});

	mapping(string:mapping(string:string)) dict_aa
			= port_to_dict_proc (port,aa);

	dict_display_proc (dict_aa);

	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
