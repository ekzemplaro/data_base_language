#! /usr/bin/pike
//
//	redis_delete.pike
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
	con->connect("host_dbase",6379);
	con->write("del " + key + "\r\n");
	con->close();
  
	write("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
