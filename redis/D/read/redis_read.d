// -------------------------------------------------------------------
/*
	redis_read.d

						Jan/17/2014
*/
// -------------------------------------------------------------------
module	redis_read;
 
import std.json;
import std.stdio;
import std.conv;

import std.socket ;

import	mcached_manipulate; 
import	redis_manipulate; 
// -------------------------------------------------------------------
void main (string[] args)
{
	writeln ("*** 開始 ***");

	auto socket = new Socket(AddressFamily.INET, SocketType.STREAM) ;

	string hostname = "host_dbase";

	socket.connect(new InternetAddress (hostname,6379)) ;


	string[] keys = ["t1851","t1852","t1853","t1854","t1855",
		"t1856","t1857","t1858","t1859"];

	foreach (key; keys)
		{
		string json_str = redis_socket_read_proc (socket,key);
		if (1 < json_str.length)
			{
			json_parser (key,json_str);
			}
		}

	socket.close() ;

	writeln ("*** 終了 ***");
}

// -------------------------------------------------------------------
