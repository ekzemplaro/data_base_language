// -------------------------------------------------------------------
//	redis_manipulate.vala
//
//					Feb/03/2014
//
// -------------------------------------------------------------------
using GLib;

// -------------------------------------------------------------------
static void redis_delete_proc (string hostname,uint16 port,string key_in)
	throws IOError
{
	var command = "del " + key_in  + "\r\n";

	print (command);
	
	Socket socket = new Socket
		(SocketFamily.IPV4, SocketType.STREAM, SocketProtocol.TCP);

	print ("*** aaa ***\n");

	assert (socket != null);

	var resolver = Resolver.get_default ();
        var addresses = resolver.lookup_by_name (hostname, null);
        var address = addresses.nth_data (0);

	print ("*** ddd ***\n");

	var client = new SocketClient ();
	print ("*** eee ***\n");

        var conn = client.connect (new InetSocketAddress (address, port));

	print ("*** fff ***\n");

        conn.output_stream.write (command.data);
        print ("Wrote request\n");

        var response = new DataInputStream (conn.input_stream);
        var status_line = response.read_line (null).strip ();
        print ("Received status line: %s\n", status_line);

	socket = null;
}

// -------------------------------------------------------------------
