// -------------------------------------------------------------------
/*
	redis_manipulate.d

						Jan/17/2014
*/
// -------------------------------------------------------------------
module	redis_manipulate;
 
import std.json;
import std.stdio;
import std.conv;

import std.socket ;

// -------------------------------------------------------------------
string redis_socket_read_proc (Socket socket,string key_in)
{
	string command = "get " ~ key_in ~ "\r\n";
	socket.send (cast(void[])command);

	char[] buf = new char[1024];

	socket.receive(buf);
	string ssx = buf.idup;
	string [] aa = std.string.split (ssx,"\n");

	int it = 0;

//	writeln (aa.length);

	string json_str = "";
	while (it < (aa.length - 1)) 
		{

		if (aa[it][0 .. 2] != "$-1")
			{
//		writeln (aa[it]);

			if (aa[it][0 .. 1] != "$")
				{
				json_str = aa[it];
				}
			}

		it++;
		}
	return	json_str;
}

// -------------------------------------------------------------------
void redis_socket_write_proc (Socket socket,string key,string json_str)
{
	ulong llx = json_str.length;

	writeln (llx);	

	socket.send (cast(void[])"*3\r\n");
	socket.send (cast(void[])"$3\r\n");
	socket.send (cast(void[])"set\r\n");
	ulong llx_key = key.length;
	string command = "$" ~ text(llx_key) ~ "\r\n";
	socket.send (cast(void[])command);
	string command_bb = key ~ "\r\n";
	socket.send (cast(void[])command_bb);
	string command_cc = "$" ~ text(llx) ~ "\r\n";
	socket.send (cast(void[])command_cc);
	string command_dd = json_str ~ "\r\n";
	socket.send (cast(void[])command_dd);


	char[] buf = new char[1024];
	socket.receive(buf);

	string ssx = buf.idup;
	string [] aa = std.string.split (ssx,"\n");

	writeln (aa[0]);
}

// -------------------------------------------------------------------
