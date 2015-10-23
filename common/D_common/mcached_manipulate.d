// -------------------------------------------------------------------
/*
	mcached_manipulate.d

						Jan/17/2014
*/
// -------------------------------------------------------------------
module	mcached_manipulate;
 
import std.json;
import std.stdio;
import std.conv;

import std.socket ;

import	json_manipulate;
// -------------------------------------------------------------------
string mcached_socket_read_proc (Socket socket,string key_in)
{
	string command = "get " ~ key_in ~ "\r\n";
	socket.send (cast(void[])command);

	char[] buf = new char[1024];

	socket.receive(buf);
	string ssx = buf.idup;
	string [] aa = std.string.split (ssx,"\n");

	int it = 0;

	string json_str = "";

	while (it < (aa.length - 1)) 
		{
		if (aa[it][0 .. 3] != "END")
			{
			if (aa[it][0 .. 5] != "VALUE")
				{
				json_str = aa[it];
				}
			}
		it++;
		}

	return	json_str;
}

// -------------------------------------------------------------------
void json_parser (string key,string json_str)
{
	auto json = parseJSON (json_str);

	string [string] unit_aa = record_parse_proc (json);

	string str_out = key ~ "\t";
	str_out ~= unit_aa["name"] ~ "\t";
	str_out ~= unit_aa["population"] ~ "\t";
	str_out ~= unit_aa["date_mod"];
	writeln (str_out);
}

// -------------------------------------------------------------------
void mcached_socket_write_proc (Socket socket,string key,string json_str)
{
	ulong llx = json_str.length;

//	writeln (llx);	

	string command = "set " ~ key ~ " 0 0 " ~ text(llx) ~ "\r\n";
//	writeln (command);

	socket.send (cast(void[])command);

	socket.send (cast(void[])json_str);
	socket.send (cast(void[])"\r\n");

	char[] buf = new char[1024];
	socket.receive(buf);
}

// -------------------------------------------------------------------
