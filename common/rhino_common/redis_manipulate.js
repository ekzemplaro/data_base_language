// ----------------------------------------------------------------------- 
/*
	redis_manipulate.js

					Jan/27/2014

*/
// ----------------------------------------------------------------------- 
function redis_keys_fetch_proc (os,is)
{
	var keys = new Array ();

	os.writeBytes("keys *\r\n");

	var responseLine = is.readLine();

	var nn = responseLine.substring (1);

	for (var it=0; it< nn; it++)
		{
		responseLine = is.readLine();
		responseLine = is.readLine();
		keys[it] = responseLine;
		}

	return	keys;
}

// ----------------------------------------------------------------------- 
function redis_fetch_proc (os,is,key_in)
{
	var json_str = "";

	os.writeBytes("get " + key_in + "\r\n"); 
	var responseLine = is.readLine();


	if (responseLine.indexOf ("$-1") < 0)
	{
	responseLine = is.readLine();

	if (responseLine != null)
		{
		json_str = responseLine;

		var unit_aa = JSON.parse (responseLine);
		var name = unit_aa["name"];
		var population = unit_aa["population"];
		var date_mod = unit_aa["date_mod"];

		var out_str = key_in + "\t" + name + "\t";
		out_str += population + "\t" + date_mod;
		print (out_str);
		}

	}

	return	json_str;
}

// ----------------------------------------------------------------------- 
