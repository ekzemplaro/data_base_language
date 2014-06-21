// -------------------------------------------------------------------
/*
	mcachedb_create.d

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

	dict_aa = dict_append_proc (dict_aa,"t1521","新潟","35926","1924-2-15");
	dict_aa = dict_append_proc (dict_aa,"t1522","長岡","43197","1924-7-25");
	dict_aa = dict_append_proc (dict_aa,"t1523","新発田","68391","1924-8-12");
	dict_aa = dict_append_proc (dict_aa,"t1524","上越","26915","1924-1-18");
	dict_aa = dict_append_proc (dict_aa,"t1525","糸魚川","31526","1924-10-21");
	dict_aa = dict_append_proc (dict_aa,"t1526","加茂","75924","1924-4-25");
	dict_aa = dict_append_proc (dict_aa,"t1527","三条","45697","1924-6-18");
	dict_aa = dict_append_proc (dict_aa,"t1528","佐渡","39481","1924-9-17");
	dict_aa = dict_append_proc (dict_aa,"t1529","柏崎","97253","1924-10-12");
	dict_aa = dict_append_proc (dict_aa,"t1530","村上","31976","1924-9-15");
	dict_aa = dict_append_proc (dict_aa,"t1531","十日町","97515","1924-2-21");
	dict_aa = dict_append_proc (dict_aa,"t1532","五泉","78419","1924-3-8");

	return	dict_aa;
}

// -------------------------------------------------------------------
void main (string[] args)
{
	writefln ("*** 開始 ***");

	string [string] [string] dict_aa = data_prepare_proc ();

	Socket socket = new Socket(AddressFamily.INET, SocketType.STREAM);

	string hostname = "localhost";

	socket.connect (new InternetAddress (hostname,21201));

	foreach (string key; dict_aa.keys)
		{
		string json_str_new = unit_to_json_str_proc (dict_aa[key]);

		mcached_socket_write_proc (socket,key,json_str_new);
		}

	socket.close ();

	writefln ("*** 終了 ***");
}

// -------------------------------------------------------------------
