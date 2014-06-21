#! /usr/bin/pike
//
//	tyrant_delete.pike
//
//						May/20/2013
//
// ----------------------------------------------------------------
import Stdio;

int main (int argc, array(string) argv)
{
	write("*** 開始 ***\n");

	string key = argv[1];
	write (key + "\n");

	object con = File();
	con->connect("127.0.0.1",1978);
	con->write("delete " + key + "\r\n");
	con->close();
  
	write("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
