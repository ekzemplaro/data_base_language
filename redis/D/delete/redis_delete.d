// -------------------------------------------------------------------
/*
	redis_delete.d

						Apr/24/2013
*/
// -------------------------------------------------------------------
module	mcached_delete;
 
import std.json;
import std.stdio;

import std.socket ;

// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string key_in = args[1];

	writefln (key_in);

	auto socket = new Socket(AddressFamily.INET, SocketType.STREAM) ;

	string hostname = "host_dbase";

	socket.connect(new InternetAddress (hostname,6379)) ;

	string command = "del " ~ key_in ~ "\r\n";
	socket.send(cast(void[])command);
	socket.close() ;

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
