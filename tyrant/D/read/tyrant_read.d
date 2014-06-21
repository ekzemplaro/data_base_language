// -------------------------------------------------------------------
/*
	tyrant_read.d

						Jan/16/2014
*/
// -------------------------------------------------------------------
module	tyrant_read;
 
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

	socket.connect(new InternetAddress (hostname,1978)) ;


	string[] keys = ["t4761","t4762","t4763","t4764","t4765",
		"t4766","t4767","t4768","t4769"];

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
