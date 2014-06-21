// --------------------------------------------------------------
//	create/mcached_create.java
//
//					Jan/07/2014
// --------------------------------------------------------------
import	java.util.HashMap; 
import	java.util.Set; 

import	java.net.Socket;
import	java.io.DataOutputStream;
import	java.io.DataInputStream;

// --------------------------------------------------------------
public class mcached_create
{
 
// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
			dict_aa = data_prepare_proc (); 

	String server = "localhost";
	int servPort = 11211;

	Socket sock = new Socket (server,servPort);

	DataOutputStream output = new DataOutputStream (sock.getOutputStream ());

	DataInputStream rr = new DataInputStream (sock.getInputStream ());

	mcached_write_proc (rr,output,dict_aa);

	rr.close ();
	output.close ();
	sock.close ();

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
static void mcached_write_proc
	(DataInputStream rr,DataOutputStream output,
	HashMap <String, HashMap <String,String>> dict_aa)
		throws Exception
{
	Set set_aaa = dict_aa.keySet ();

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;
		HashMap <String,String> dict_unit = dict_aa.get (key_aa);

		String nnx = dict_unit.get ("name");
		String ppx = dict_unit.get ("population");
		int population = Integer.parseInt (ppx);
		String ddx = dict_unit.get ("date_mod");

		String json_str = json_manipulate.unit_json_gen_proc
				(nnx,population,ddx);

	System.out.println (json_str);

		mcached_socket.socket_write_proc (key,json_str,rr,output);

//		mcached_manipulate.data_put_proc (mc,key,nnx,population,ddx);
		}
}
 
// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1731","金沢",27139,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1732","輪島",43872,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1733","小松",91253,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1734","七尾",87624,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1735","珠洲",72538,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1736","加賀",21579,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1737","羽咋",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1738","かほく",47361,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1739","白山",51872,"2008-10-24");

	return	dict_aa;
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
