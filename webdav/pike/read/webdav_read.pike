#! /usr/bin/pike
//
//	webdav_read.pike
//
//						Sep/12/2013
//
// ----------------------------------------------------------------
#include	"/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string url_in = "http://host_dbase:3004/city/tokyo.json";
//	write ("%s",Protocols.HTTP.get_url_data (url_in));

	string content=Protocols.HTTP.get_url_data (url_in);
 
	mapping(string:mapping(string:string)) dict_aa
			= Standards.JSON.decode (content);

	dict_display_proc (dict_aa); 
	 
	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
