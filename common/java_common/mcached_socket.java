// --------------------------------------------------------------
//	mcached_socket.java
//
//					Feb/04/2015
// --------------------------------------------------------------
import	java.util.HashMap;
import	java.util.Set; 

import	java.net.Socket;
import	java.io.DataOutputStream;
import	java.io.DataInputStream;
// --------------------------------------------------------------
public class mcached_socket
{
 
// --------------------------------------------------------------
static String socket_read_proc (String key,
	DataInputStream rr,DataOutputStream output) throws Exception
{
	String str_json  = "";
	String command = "get " + key + "\r\n";
	output.writeBytes (command);
	output.flush ();

	byte[] buffer = new byte[1024];
	StringBuffer sb = new StringBuffer ();

	int len;

	while (0 <= (len = rr.read (buffer)))
		{
		sb.append (new String (buffer,0, len));

		String [] lines = sb.toString ().split ("[\n]",-1);
		boolean flag_break = false;
		for (int it=0; it < lines.length; it++)
			{
			if (lines[it].startsWith("END"))
				{
				flag_break = true;
				}
			else if (lines[it].startsWith("VALUE"))
				{
				}
			else if (lines[it].contains ("name"))
				{
//				System.out.print (key + "\t");

				str_json  = (String)lines[it];
				}
			}

		if (flag_break)
			{
			break;
			}
		}

	return	str_json;
}
// --------------------------------------------------------------
static void socket_write_proc (String key,String value_in,
	DataInputStream rr,DataOutputStream output) throws Exception
{
	int llx = value_in.getBytes().length;
	String command = "set " + key + " 0 0 " + llx + "\r\n";
//	System.out.println (command);

	output.writeBytes (command);
	output.flush ();

	byte[] command_bb =  value_in.getBytes();
	String rn = "\r\n";
//	System.out.println (command_bb);
	output.write (command_bb);
	output.writeBytes (rn);
	output.flush ();

	byte[] buffer = new byte[1024];
	StringBuffer sb = new StringBuffer ();

	int len;

	while (0 <= (len = rr.read (buffer)))
		{
		sb.append (new String (buffer,0, len));

		String [] lines = sb.toString ().split ("[\n]",-1);
		boolean flag_break = false;
		for (int it=0; it < lines.length; it++)
			{
			if (lines[it].startsWith("STORED"))
				{
				flag_break = true;
				}
			}

//	System.out.println (sb.toString ());

		if (flag_break)
			{
			break;
			}
		}
}

// --------------------------------------------------------------
static void socket_delete_record_proc (String key,
	DataInputStream rr,DataOutputStream output) throws Exception
{
	String command = "delete " + key + "\r\n";
	output.writeBytes (command);
	output.flush ();

	byte[] buffer = new byte[1024];
	StringBuffer sb = new StringBuffer ();

	int len;

	while (0 <= (len = rr.read (buffer)))
		{
		sb.append (new String (buffer,0, len));

		String [] lines = sb.toString ().split ("[\n]",-1);
		boolean flag_break = false;
		for (int it=0; it < lines.length; it++)
			{
			if (lines[it].startsWith("DELETED"))
				{
				flag_break = true;
				}
			else if (lines[it].startsWith("NOT_FOUND"))
				{
				flag_break = true;
				}
			}

	System.out.println (sb.toString ());

		if (flag_break)
			{
			break;
			}
		}
}

// --------------------------------------------------------------
static void dict_to_mcached_proc
//	(DataInputStream rr,DataOutputStream output,
	(String server,int port,
	HashMap <String, HashMap <String,String>> dict_aa)
		throws Exception
{
	Socket sock = new Socket (server,port);

	DataOutputStream output = new DataOutputStream (sock.getOutputStream ());

	DataInputStream rr = new DataInputStream (sock.getInputStream ());

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
		}

	rr.close ();
	output.close ();
	sock.close ();
}
// --------------------------------------------------------------
static HashMap <String, HashMap<String,String>>
	mcached_to_dict_proc (String server,int port,String [] keys_in)
		throws Exception
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	Socket sock = new Socket (server,port);

	DataOutputStream output = new DataOutputStream (sock.getOutputStream ());

	DataInputStream rr = new DataInputStream (sock.getInputStream ());

	for (String key : keys_in)
		{
		String str_json = mcached_socket.socket_read_proc (key,rr,output);

		if (str_json != null)
			{
			if (2 < str_json.length ())
				{
				HashMap <String,String>  unit_aa
			= json_manipulate.unit_json_parser (str_json);
			
				dict_aa.put (key,unit_aa);
				}
			}
		}

	rr.close ();
	output.close ();
	sock.close ();

	return	dict_aa;
}
// --------------------------------------------------------------
static void mcached_update_proc (String server,int port,
	String key,int population) throws Exception
{
	Socket sock = new Socket (server,port);

	DataOutputStream output = new DataOutputStream (sock.getOutputStream ());

	DataInputStream rr = new DataInputStream (sock.getInputStream ()); 

	String str_json = mcached_socket.socket_read_proc (key,rr,output);

	System.out.println (str_json);
/*
	HashMap <String,Object>  unit_aa = (HashMap <String,Object>)JSON.decode (str_json);

*/
	HashMap <String,String>  unit_aa
			= json_manipulate.unit_json_parser (str_json);

	String name = unit_aa.get ("name").toString ();
	System.out.println (name);

	String date_mod = text_manipulate.get_current_date_proc ();

	String json_new = json_manipulate.unit_json_gen_proc
				(name,population,date_mod);
	System.out.println (json_new);
	mcached_socket.socket_write_proc (key,json_new,rr,output);

	rr.close ();
	output.close ();
	sock.close ();
}

// --------------------------------------------------------------
static void mcached_delete_proc (String server,int port,String key)
	throws Exception
{
	Socket sock = new Socket (server,port);

	DataOutputStream output = new DataOutputStream (sock.getOutputStream ());

	DataInputStream rr = new DataInputStream (sock.getInputStream ());

	mcached_socket.socket_delete_record_proc (key,rr,output);

	rr.close ();
	output.close ();
	sock.close ();
} 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
