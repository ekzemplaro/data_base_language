// -------------------------------------------------------------------
/*
	tyrant_create.d

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

	dict_aa = dict_append_proc (dict_aa,"t4761","那覇","34726","1924-4-7");
	dict_aa = dict_append_proc (dict_aa,"t4762","宜野湾","29718","1924-8-14");
	dict_aa = dict_append_proc (dict_aa,"t4763","石垣","59136","1924-10-22");
	dict_aa = dict_append_proc (dict_aa,"t4764","浦添","26715","1924-1-18");
	dict_aa = dict_append_proc (dict_aa,"t4765","名護","31496","1924-12-21");
	dict_aa = dict_append_proc (dict_aa,"t4766","糸満","75924","1924-4-25");
	dict_aa = dict_append_proc (dict_aa,"t4767","沖縄","45617","1924-6-18");
	dict_aa = dict_append_proc (dict_aa,"t4768","豊見城","39481","1924-9-17");
	dict_aa = dict_append_proc (dict_aa,"t4769","うるま","97253","1924-10-12");

	return	dict_aa;
}

// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string [string] [string] dict_aa = data_prepare_proc ();

	Socket socket = new Socket(AddressFamily.INET, SocketType.STREAM);

	string hostname = "localhost";

	socket.connect (new InternetAddress (hostname,1978));

	foreach (string key; dict_aa.keys)
		{
		string json_str_new = unit_to_json_str_proc (dict_aa[key]);

		mcached_socket_write_proc (socket,key,json_str_new);
		}

	socket.close ();

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
