// ----------------------------------------------------------------------- 
/*
	mcached_manipulate.js

					Feb/05/2015

*/
// ----------------------------------------------------------------------- 
function socket_write_proc (key_in,value_in,is,os)
{
	var value_str = new java.lang.String (value_in);
	var llx = value_str.getBytes().length;

	var command = "set " + key_in + " 0 0 " + llx + "\r\n";
	os.writeBytes(command);

	var command_bb = value_str.getBytes();

	os.write (command_bb); 
	os.writeBytes ("\r\n"); 
	var rec_0 = is.readLine();
}

// ----------------------------------------------------------------------- 
function socket_read_proc (key_in,is,os)
{
	var json_str = "";

	os.writeBytes("get " + key_in + "\r\n"); 
	var rec_0 = is.readLine();

	if (rec_0 == "END")
		{
//		print (rec_0);
		}
	else
		{
		var json_str = is.readLine();
		rec_2 = is.readLine();
		}

	return	json_str;
}

// ----------------------------------------------------------------------- 
function mcached_fetch_proc (os,is,key_in)
{
	var json_str = socket_read_proc (key_in,is,os);

	if (json_str)
	{
	var unit_aa = JSON.parse (json_str);
	var name = unit_aa["name"];
	var population = unit_aa["population"];
	var date_mod = unit_aa["date_mod"];

	var out_str = key_in + "\t" + name + "\t";
	out_str += population + "\t" + date_mod;
	print (out_str);
	}
}

// ----------------------------------------------------------------------- 
function socket_delete_record_proc (out,is,key_in)
{
	out.writeBytes("delete " + key_in + "\r\n"); 
	var responseLine = is.readLine();
        print (responseLine);
}

// ----------------------------------------------------------------------- 
function mcached_to_dict_proc (server,port,keys)
{
	var dict_aa = new Object ()

	var socket = new Socket(server,port)
	var os = new DataOutputStream (socket.getOutputStream())
	var is = new BufferedReader
		(new InputStreamReader (socket.getInputStream()))

	if (socket != null && os != null && is != null)
		{
		for (var it in keys)
			{
			var key = keys[it]
			var json_str = socket_read_proc (key,is,os)
			if (json_str)
				{
				var unit_aa = JSON.parse (json_str)
				dict_aa[key] = unit_aa
				}

			}
		}

	os.close()
	is.close()
	socket.close()

	return	dict_aa
}

// ----------------------------------------------------------------------- 
function dict_to_mcached_proc (server,port,dict_aa)
{
	var socket = new Socket(server,port)
	var os = new DataOutputStream(socket.getOutputStream())
	var is = new BufferedReader
		(new InputStreamReader (socket.getInputStream())) 

	for (var key in dict_aa)
		{
		var str_json = JSON.stringify (dict_aa[key])
		print (str_json)

		socket_write_proc (key,str_json,is,os)
		}

	os.close()
	is.close()
	socket.close()
}

// ----------------------------------------------------------------------- 
function mcached_update_proc (server,port,key,population)
{
	var socket = new Socket (server,port)
	var os = new DataOutputStream(socket.getOutputStream())
	var is = new BufferedReader
		(new InputStreamReader (socket.getInputStream()))

	var json_str = socket_read_proc (key_in,is,os)

	print (json_str)

	if (json_str != null)
	{
	var unit_aa = JSON.parse (json_str)

	unit_aa['population'] = population_in
	unit_aa['date_mod'] = get_current_date_proc ()
	print ("key_in = " + key_in)

	var json_new = JSON.stringify (unit_aa)

	print (json_new)

	socket_write_proc (key_in,json_new,is,os)
	}

	os.close()
	is.close()
	socket.close() 
}

// ----------------------------------------------------------------------- 
function mcached_delete_proc (server,port,key_in)
{
	var socket = new Socket (server,port)
	var os = new DataOutputStream(socket.getOutputStream())
	var is = new BufferedReader
		(new InputStreamReader (socket.getInputStream()))

	if (socket != null && os != null && is != null)
		{
		socket_delete_record_proc (os,is,key_in)
		}

	os.close()
	is.close()
	socket.close()
}

// ----------------------------------------------------------------------- 
