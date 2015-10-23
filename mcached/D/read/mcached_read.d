// -------------------------------------------------------------------
/*
	mcached_read.d

						Jan/16/2014
*/
// -------------------------------------------------------------------
module	mcached_read;
 
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

	socket.connect(new InternetAddress (hostname,11211)) ;


	string[] keys = ["t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"];

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
