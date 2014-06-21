// -------------------------------------------------------------------
/*
	tyrant_update.d

						Jan/17/2014
*/
// -------------------------------------------------------------------
module	tyrant_update;
 
import std.json;
import std.stdio;
import std.conv;

import std.socket ;

import	json_manipulate; 
import	text_manipulate; 
import	mcached_manipulate; 
// -------------------------------------------------------------------
void main (string[] args)
{
	writeln ("*** 開始 ***");

	string key_in = args[1];
	string population_in = args[2];
	writeln (key_in ~ "\t" ~ population_in);

	Socket socket = new Socket(AddressFamily.INET, SocketType.STREAM) ;

	string hostname = "localhost";

	socket.connect(new InternetAddress (hostname,1978)) ;

	string json_str = mcached_socket_read_proc (socket,key_in);
	if (1 < json_str.length)
		{
		string json_str_new = json_update_proc (json_str,population_in);
		writeln (json_str_new);
		writeln (json_str_new.length);
		mcached_socket_write_proc (socket,key_in,json_str_new);
		}

	socket.close() ;

	writeln ("*** 終了 ***");
}

// -------------------------------------------------------------------
