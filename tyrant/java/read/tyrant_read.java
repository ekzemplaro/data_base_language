// --------------------------------------------------------------
//	tyrant_read.java
//
//					Apr/22/2013
// --------------------------------------------------------------
import java.util.HashMap;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketException;

import  net.arnx.jsonic.JSON; 
// --------------------------------------------------------------
public class tyrant_read
{
 
// --------------------------------------------------------------
public static void main(String[] args)
	throws IOException
{
	System.out.println ("*** 開始 ***");
 
	String server = "localhost";
	int port = 1978;
	System.out.println (server);
	System.out.println (port);


	String [] keys = {"t4761","t4762","t4763","t4764","t4765",
		"t4766","t4767","t4768","t4769"};

	HashMap <String, HashMap<String,String>> dict_aa =
		socket_proc (keys,server,port);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
}
 
// --------------------------------------------------------------
static HashMap <String, HashMap<String,String>> socket_proc (String [] keys,String server,int port)
	throws IOException
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

        Socket socket = new Socket(server, port);
//        System.out.println("サーバとの接続を確立。");
 
	InputStream in = socket.getInputStream();
	OutputStream out = socket.getOutputStream();


	for (String key : keys)
		{
		HashMap <String,String>unit_aa
			= socket_manipulate.socket_read_proc (key,in,out);

		if (unit_aa != null)
			{
			dict_aa.put (key,unit_aa);
			}
		}

        socket.close();

	return	dict_aa;
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
