#! /usr/bin/pike
//
//	exist_read.pike
//
//						Feb/16/2011
//
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string url_in = "http://localhost:8086/exist/rest/cities/cities.xml";

	write ("%s",Protocols.HTTP.get_url_data (url_in));
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
