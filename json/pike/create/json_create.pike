#! /usr/bin/pike
//
//	json_create.pike
//
//						Sep/06/2016
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t0921","宇都宮","57149","1920-9-17");
	dict_aa =  dict_append_proc (dict_aa,"t0922","小山","35627","1920-2-5");
	dict_aa =  dict_append_proc (dict_aa,"t0923","佐野","19832","1920-7-4");
	dict_aa =  dict_append_proc (dict_aa,"t0924","足利","57924","1920-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t0925","日光","34812","1920-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t0926","下野","67914","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t0927","さくら","51926","1920-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t0928","矢板","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t0929","真岡","75421","1920-6-18");
	dict_aa =  dict_append_proc (dict_aa,"t0930","栃木","42139","1920-9-21");
	dict_aa =  dict_append_proc (dict_aa,"t0931","大田原","21345","1920-3-15");
	dict_aa =  dict_append_proc (dict_aa,"t0932","鹿沼","13872","1920-5-25");
	dict_aa =  dict_append_proc (dict_aa,"t0933","那須塩原","36572","1920-7-26");
	dict_aa =  dict_append_proc (dict_aa,"t0934","那須烏山","27196","1920-11-12");

	return	dict_aa;
}

// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write	("*** 開始 ***\n");

	string file_out = argv[1];

	write (file_out + "\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

	string json_str = Standards.JSON.encode(dict_aa);

	write_file (file_out,json_str,0777);

	write	("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
