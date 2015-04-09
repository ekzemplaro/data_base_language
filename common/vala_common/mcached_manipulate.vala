// -------------------------------------------------------------------
//	mcached_manipulate.vala
//
//					Feb/07/2014
//
// -------------------------------------------------------------------
using GLib;
using Json;

// -------------------------------------------------------------------
static void mcached_delete_proc (string hostname,uint16 port,string key_in)
	throws IOError
{
	var command = "delete " + key_in  + "\r\n";
	
	Socket socket = new Socket
		(SocketFamily.IPV4, SocketType.STREAM, SocketProtocol.TCP);

	assert (socket != null);

	var resolver = Resolver.get_default ();
        var addresses = resolver.lookup_by_name (hostname, null);
        var address = addresses.nth_data (0);

	var client = new SocketClient ();
        var conn = client.connect (new InetSocketAddress (address, port));

        conn.output_stream.write (command.data);
        print ("Wrote request\n");

        var response = new DataInputStream (conn.input_stream);
        var status_line = response.read_line (null).strip ();
        print ("Received status line: %s\n", status_line);

	socket = null;
}

// -------------------------------------------------------------------
static void json_parser (string key_in,string str_json)
{
	var parser = new Json.Parser ();
	parser.load_from_data (str_json, -1);

	var root = parser.get_root ().get_object ();


	var name = root.get_string_member ("name");
//	var population = root.get_int_member ("population");
	var population = root.get_string_member ("population");
	var date_mod = root.get_string_member ("date_mod");

	stdout.printf ("%s\t", key_in);
	stdout.printf ("%s\t", name);
//	stdout.printf ("%lld\t", population);
	stdout.printf ("%s\t", population);
	stdout.printf ("%s\n", date_mod);
}

// -------------------------------------------------------------------
static void mcached_read_proc (string hostname,uint16 port,string[] keys)
	throws IOError
{
/*
	Socket socket = new Socket (SocketFamily.IPV4, SocketType.STREAM, SocketProtocol.TCP);
	assert (socket != null);

	var resolver = Resolver.get_default ();
        var addresses = resolver.lookup_by_name (hostname, null);
        var address = addresses.nth_data (0);

	var client = new SocketClient ();

	stdout.puts ("connected\n");
*/
foreach (string key in keys)
	{
/*
        var conn = client.connect (new InetSocketAddress (address, port));

	var command = "get " + key  + "\r\n";
        conn.output_stream.write (command.data);

	var response = new DataInputStream (conn.input_stream);
	var line = response.read_line (null).strip ();
//        print ("Received status line: %s\n", status_line);

	if (line != "END")
		{
		var json_str = response.read_line (null).strip ();
		json_parser (key,json_str);

		line = response.read_line (null).strip ();
		}
*/
	var json_str = mcached_get_proc (hostname,port,key);

	if (1 < json_str.length)
		{
		json_parser (key,json_str);
		}
	}

//	socket = null;
}

// -------------------------------------------------------------------
static string to_json_proc
	(string name,string population,string date_mod)
{
	var gen = new Generator ();
	var root = new Json.Node (NodeType.OBJECT);
	var object = new Json.Object ();
	root.set_object (object);
	gen.set_root (root);

	object.set_string_member ("name",name);
	object.set_string_member ("population",population);
	object.set_string_member ("date_mod",date_mod);

	size_t length;

	string json_str = gen.to_data(out length);

	return	json_str;
}

// -------------------------------------------------------------------
static string json_update_proc (string str_json,int population_in)
{
	var parser = new Json.Parser ();
	parser.load_from_data (str_json, -1);

	var root = parser.get_root ().get_object ();

	var name = root.get_string_member ("name");
	var population = root.get_int_member ("population");
	var date_mod = root.get_string_member ("date_mod");

	stdout.printf ("%s\t", name);
	stdout.printf ("%lld\t", population);
	stdout.printf ("%s\n", date_mod);

	var today = GLib.Time.local (time_t ()).to_string ();

	var json_str = to_json_proc
		(name,population_in.to_string (),today);
	
	return	json_str;
}

// -------------------------------------------------------------------
static string mcached_get_proc
	(string hostname,uint16 port,string key)
	throws IOError
{
	string json_str = "";

	Socket socket = new Socket (SocketFamily.IPV4, SocketType.STREAM, SocketProtocol.TCP);
	assert (socket != null);

	var resolver = Resolver.get_default ();
        var addresses = resolver.lookup_by_name (hostname, null);
        var address = addresses.nth_data (0);

	var client = new SocketClient ();

//	stdout.puts ("connected\n");

        var conn = client.connect (new InetSocketAddress (address, port));
//	stdout.puts (key + "\n");

	var command = "get " + key  + "\r\n";
        conn.output_stream.write (command.data);
//        print ("Wrote request\n");

        // Receive response
	var response = new DataInputStream (conn.input_stream);
	var line = response.read_line (null).strip ();
//        print ("Received status line: %s\n", status_line);

	if (line != "END")
		{
		json_str = response.read_line (null).strip ();


		line = response.read_line (null).strip ();
		}

	socket = null;

	return	json_str;
}

// -------------------------------------------------------------------
static void mcached_put_proc
	(string hostname,uint16 port,string key_in,string json_str)
	throws IOError
{
	var llx = json_str.size ();

	string command = "set " + key_in + " 0 0 " + llx.to_string ()  + "\r\n";
//	stdout.printf ("%s\n", command);
	
	Socket socket = new Socket
		(SocketFamily.IPV4, SocketType.STREAM, SocketProtocol.TCP);

	assert (socket != null);

	var resolver = Resolver.get_default ();
        var addresses = resolver.lookup_by_name (hostname, null);
        var address = addresses.nth_data (0);

	var client = new SocketClient ();
        var conn = client.connect (new InetSocketAddress (address, port));

	conn.output_stream.write (command.data);
	conn.output_stream.write (json_str.data);
	conn.output_stream.write ("\r\n".data);
 //       print ("Wrote request\n");

	var response = new DataInputStream (conn.input_stream);
	var status_line = response.read_line (null).strip ();
//      print ("Received status line: %s\n", status_line);


	socket = null;
}

// -------------------------------------------------------------------
static void mcached_update_proc
	(string hostname,uint16 port,string key_in,int population_in)
	throws IOError
{
	var json_str = mcached_get_proc (hostname,port,key_in);

	if (1 < json_str.length)
		{
	var json_str_new = json_update_proc (json_str,population_in);

	stdout.printf ("%s\n", json_str_new);
	mcached_put_proc (hostname,port,key_in,json_str_new);
		}
}


// -------------------------------------------------------------------
// -------------------------------------------------------------------
