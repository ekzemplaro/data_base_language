#! /usr/bin/pike
//
//	xindice_read.pike
//
//						Feb/16/2011
//
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string url_in = "http://host_xindice:8888/xindice/db/cities/cities";

	write ("%s",Protocols.HTTP.get_url_data (url_in));
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
