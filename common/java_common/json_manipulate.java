// -----------------------------------------------------------------------
/*
	json_manipulate.java


				Jan/06/2014
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;
import	net.arnx.jsonic.JSON;

// -----------------------------------------------------------------------
public class json_manipulate
{

// -----------------------------------------------------------------------
static HashMap <String, HashMap<String,String>>
	json_to_dict_proc (String json_str)
{
	HashMap <String, HashMap<String,String>>  dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	try
	{
	dict_aa = (HashMap <String, HashMap<String,String>>)JSON.decode (json_str);
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	return	dict_aa;
}

// -----------------------------------------------------------------------
static String	dict_to_json_proc
	(HashMap <String, HashMap<String,String>> dict_aa)
{
	String str_json = "";

	try
		{
		str_json = JSON.encode (dict_aa);
		}
	catch	(Exception ee)
		{
		ee.printStackTrace ();
		}

	return	str_json;
}

// -----------------------------------------------------------------------
static String unit_json_gen_proc 
	(String name_in,int population_in,String date_mod_in)
{
/*
	String value  = "{\"name\":\"" + name_in + "\",";
	value +=  "\"population\":" + population_in + ",";
	value += "\"date_mod\":\"" + date_mod_in + "\"}";

	return	value;
*/

	HashMap <String,String> unit_aa
				= new HashMap <String,String> ();

	String str_population = Integer.toString (population_in);

	unit_aa.put ("name",name_in);
	unit_aa.put ("population",str_population);
	unit_aa.put ("date_mod",date_mod_in);

	String str_json = JSON.encode (unit_aa);

	return	str_json;
}

// -----------------------------------------------------------------------
}

// -----------------------------------------------------------------------
