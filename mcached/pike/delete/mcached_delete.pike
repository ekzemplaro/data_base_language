#! /usr/bin/pike
//
//	mcached_delete.pike
//
//						Aug/27/2013
//
// ----------------------------------------------------------------
import Stdio;

// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write("*** 開始 ***\n");

	string key = argv[1];
	write (key + "\n");

	int port = 11211;

	object con = File();
	con->connect("127.0.0.1",port);
	con->write("delete " + key + "\r\n");
	con->close();
  
	write("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
