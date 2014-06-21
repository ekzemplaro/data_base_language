// -------------------------------------------------------------------
/*
	mcached_create.d

						Jan/17/2014
*/
// -------------------------------------------------------------------
module	mcached_create;

import	std.stdio;
import	std.json;
import	std.conv;
import	std.socket;

import	text_manipulate; 
import	json_manipulate; 
import	mcached_manipulate; 
// -------------------------------------------------------------------
string [string] [string] data_prepare_proc ()
{ 
	string [string] [string] dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1731","金沢","91326","1924-2-15");
	dict_aa = dict_append_proc (dict_aa,"t1732","輪島","54297","1924-7-25");
	dict_aa = dict_append_proc (dict_aa,"t1733","小松","68591","1924-8-12");
	dict_aa = dict_append_proc (dict_aa,"t1734","七尾","26715","1924-1-18");
	dict_aa = dict_append_proc (dict_aa,"t1735","珠洲","31496","1924-10-21");
	dict_aa = dict_append_proc (dict_aa,"t1736","加賀","75924","1924-4-25");
	dict_aa = dict_append_proc (dict_aa,"t1737","羽咋","45617","1924-6-18");
	dict_aa = dict_append_proc (dict_aa,"t1738","かほく","39481","1924-9-17");
	dict_aa = dict_append_proc (dict_aa,"t1739","白山","97253","1924-10-12");

	return	dict_aa;
}

// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string [string] [string] dict_aa = data_prepare_proc ();

	Socket socket = new Socket(AddressFamily.INET, SocketType.STREAM);

	string hostname = "localhost";

	socket.connect (new InternetAddress (hostname,11211));

	foreach (string key; dict_aa.keys)
		{
		string json_str_new = unit_to_json_str_proc (dict_aa[key]);

		mcached_socket_write_proc (socket,key,json_str_new);
		}

	socket.close ();

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
