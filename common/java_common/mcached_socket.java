// --------------------------------------------------------------
//	mcached_socket.java
//
//					Jan/07/2014
// --------------------------------------------------------------
import	java.util.HashMap;

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
				System.out.print (key + "\t");

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
}
// --------------------------------------------------------------
