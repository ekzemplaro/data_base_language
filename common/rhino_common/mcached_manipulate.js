// ----------------------------------------------------------------------- 
/*
	mcached_manipulate.js

					Jan/07/2014

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
function mcached_delete_proc (out,is,key_in)
{
	out.writeBytes("delete " + key_in + "\r\n"); 
	var responseLine = is.readLine();
        print (responseLine);
}

// ----------------------------------------------------------------------- 
