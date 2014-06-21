// ----------------------------------------------------------------
//
//	mcached_manipulate.pike
//
//						Aug/27/2013
//
// ----------------------------------------------------------------
import Stdio;

// ----------------------------------------------------------------
mapping(string:mapping(string:string)) port_to_dict_proc (int port,array aa)
{
	object con = File();
	con->connect("127.0.0.1",port);

	mapping(string:mapping(string:string)) dict_aa = ([]);

	foreach (aa, string key)
		{
		string json_str = get_record_proc (con,key);
//		write (key + "\t" + json_str + "\n");

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

	return dict_aa;
}

// ----------------------------------------------------------------
string get_record_proc (object con,string key)
{
	con->write("get " + key + "\r\n");
	string reply = con->read(1024,1);
//	write (reply);

	string delimit = "\n";

	array(string) lines = reply / delimit;

//	write (sprintf ("%d\n",sizeof (lines)));
//	write (lines[1] + "\n");

	return	lines[1];
}

// ----------------------------------------------------------------
void dict_to_port_proc
	(mapping(string:mapping(string:string)) dict_aa,int port)
{
	object con = File();
	con->connect("127.0.0.1",port);

	array aa = indices (dict_aa);

	foreach (aa, string key)
		{
		mapping(string:string) unit_aa = dict_aa[key];

		string json_str = Standards.JSON.encode(unit_aa);

		set_record_proc (con,key,json_str);
		}

	con->close();
}

// ----------------------------------------------------------------
void set_record_proc (object con,string key,string json_str)
{
	int llx = strlen (json_str);

	string command = "set " + key + " 0 0 " + llx + "\r\n";

//	write (key + "\t" + llx + "\t" +  json_str + "\n");
//	write (command);

	con->write(command);
	con->write(json_str + "\r\n");
	string reply = con->read(1024,1);
//	write (reply);
}

// ----------------------------------------------------------------
void con_update_proc (object con,string key,string population_in)
{
	string json_str = get_record_proc (con,key);

	write (json_str + "\n");

	if (json_str != "")
		{
		mapping(string:string) unit_aa
			= Standards.JSON.decode (json_str);

		string name = unit_aa["name"];

		write (name + "\n");

		unit_aa["population"] = population_in;

		unit_aa["date_mod"] = get_current_date_proc ();

		json_str = Standards.JSON.encode(unit_aa);

		set_record_proc (con,key,json_str);
		}
}

// ----------------------------------------------------------------
