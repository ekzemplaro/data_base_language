#! /usr/bin/pike
//
//	redis_manipulate.pike
//
//						Aug/27/2013
//
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) redis_to_dict_proc (string host)
{
	int port = 6379;

	object con = File();
	con->connect(host,port);
	con->write("keys *\r\n");
	string reply = con->read(1024,1);

//	write (reply);

	array(string) bb = reply / "\r\n";

//	write (bb[0] + "\n");
//	write (bb[0][1..] + "\n");

	int nnx = (int)bb[0][1..];

	mapping(string:mapping(string:string)) dict_aa = ([]);

	for(int it=0; it<nnx; it=it+1)
		{
		string key = bb[it*2 + 2];

		string json_str = redis_get_record_proc (con,key);

		if (json_str != "")
			{
			mapping(string:string) unit_aa
				= Standards.JSON.decode (json_str);
			string name = unit_aa["name"];
			string population = (string)unit_aa["population"];
			string date_mod = unit_aa["date_mod"];
			dict_aa =  dict_append_proc (dict_aa,key,name,population,date_mod);
			}	
		}

	con->close();

	return	dict_aa;
}

// ----------------------------------------------------------------
string redis_get_record_proc (object con,string key)
{
//	write (key + "\n");
	string command = "get " + key + "\r\n";
//	write (command);
	con->write(command);
	string reply = con->read(1024,1);
	array(string) cc = reply / "\r\n";
	string json_str = cc[1];

	return	json_str;
}

// ----------------------------------------------------------------
void dict_to_redis_proc
	(mapping(string:mapping(string:string)) dict_aa,string host)
{
	int port = 6379;

	object con = File();
	con->connect(host,port);

	array aa = indices (dict_aa);

	foreach (aa, string key)
		{
		mapping(string:string) unit_aa = dict_aa[key];

		string json_str = Standards.JSON.encode(unit_aa);

		write (key + "\n");

		set_redis_record_proc (con,key,json_str);
		}

	con->close();
}

// ----------------------------------------------------------------
void set_redis_record_proc (object con,string key,string json_str)
{
	string command = "set " + key + " " + json_str + "\r\n";

	con->write(command);
	string reply = con->read(1024,1);
//	write (reply);
}

// ----------------------------------------------------------------
void redis_update_proc (object con,string key,string population_in)
{
	string json_str = redis_get_record_proc (con,key);

	write (json_str + "\n");

	if (json_str != "")
		{
		mapping(string:string) unit_aa
			= Standards.JSON.decode (json_str);

		unit_aa["population"] = population_in;

		unit_aa["date_mod"] = get_current_date_proc ();

		json_str = Standards.JSON.encode(unit_aa);

		set_redis_record_proc (con,key,json_str);
		}
}

// ----------------------------------------------------------------
