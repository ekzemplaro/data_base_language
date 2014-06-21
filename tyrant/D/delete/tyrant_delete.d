// -------------------------------------------------------------------
/*
	tyrant_delete.d

						May/20/2013
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

	string hostname = "localhost";

	socket.connect(new InternetAddress (hostname,1978)) ;

	string command = "delete " ~ key_in ~ "\r\n";
	socket.send(cast(void[])command);
	socket.close() ;

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
