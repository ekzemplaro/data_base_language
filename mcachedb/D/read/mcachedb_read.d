// -------------------------------------------------------------------
/*
	mcachedb_read.d

						Jan/16/2014
*/
// -------------------------------------------------------------------
module	mcachedb_read;
 
import std.json;
import std.stdio;
import std.conv;

import std.socket ;

import	mcached_manipulate; 
// -------------------------------------------------------------------
void main (string[] args)
{
	writeln ("*** 開始 ***");

	auto socket = new Socket(AddressFamily.INET, SocketType.STREAM) ;

	string hostname = "localhost";

	socket.connect(new InternetAddress (hostname,21201)) ;


	string[] keys = ["t1521","t1522","t1523","t1524","t1525",
		"t1526","t1527","t1528","t1529","t1530","t1531","t1532"];

	foreach (key; keys)
		{
		string json_str = mcached_socket_read_proc (socket,key);
		if (1 < json_str.length)
			{
			json_parser (key,json_str);
			}
		}

	socket.close() ;

	writeln ("*** 終了 ***");
}

// -------------------------------------------------------------------
