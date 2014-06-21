// -------------------------------------------------------------------
/*
	redis_create.d

						Jan/17/2014
*/
// -------------------------------------------------------------------
module	redis_create;

import	std.stdio;
import	std.json;
import	std.conv;
import	std.socket;

import	text_manipulate; 
import	json_manipulate; 
import	redis_manipulate; 
// -------------------------------------------------------------------
string [string] [string] data_prepare_proc ()
{ 
	string [string] [string] dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1851","福井","32546","1924-9-24");
	dict_aa = dict_append_proc (dict_aa,"t1852","敦賀","29167","1924-2-17");
	dict_aa = dict_append_proc (dict_aa,"t1853","小浜","59721","1924-1-8");
	dict_aa = dict_append_proc (dict_aa,"t1854","大野","26715","1924-5-9");
	dict_aa = dict_append_proc (dict_aa,"t1855","勝山","31496","1924-10-21");
	dict_aa = dict_append_proc (dict_aa,"t1856","鯖江","75924","1924-4-25");
	dict_aa = dict_append_proc (dict_aa,"t1857","あわら","45617","1924-6-18");
	dict_aa = dict_append_proc (dict_aa,"t1858","越前","39481","1924-9-17");
	dict_aa = dict_append_proc (dict_aa,"t1859","坂井","97253","1924-10-12");

	return	dict_aa;
}

// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string [string] [string] dict_aa = data_prepare_proc ();

	Socket socket = new Socket(AddressFamily.INET, SocketType.STREAM);

	string hostname = "host_dbase";

	socket.connect (new InternetAddress (hostname,6379));

	foreach (string key; dict_aa.keys)
		{
		string json_str_new = unit_to_json_str_proc (dict_aa[key]);

		redis_socket_write_proc (socket,key,json_str_new);
		}

	socket.close ();

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
