#! /usr/bin/pike
//
//	csv_read.pike
//
//						Mar/10/2011
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
#include	"/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write	("*** 開始 ***\n");

	string file_in = argv[1];

	write (file_in + "\n");

	mapping(string:mapping(string:string)) dict_aa
			= csv_read_proc (file_in);

	dict_display_proc (dict_aa);

	write	("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
