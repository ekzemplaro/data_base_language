#! /usr/bin/pike
//
//	text_delete.pike
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

	string file_txt = argv[1];
	string id_in = argv[2];

	write (file_txt + "\n");
	write (id_in + "\n");

	mapping(string:mapping(string:string)) dict_aa
			= text_read_proc (file_txt);

	m_delete (dict_aa, id_in);

	text_write_proc (file_txt,dict_aa);

	dict_display_proc (dict_aa);

	write	("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
