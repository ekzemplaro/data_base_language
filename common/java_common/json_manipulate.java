// -----------------------------------------------------------------------
/*
	json_manipulate.java


				Jan/12/2020
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
// -----------------------------------------------------------------------
public class json_manipulate
{

// -----------------------------------------------------------------------
static HashMap <String, HashMap<String,String>>
	json_to_dict_proc (String json_str)
{
	HashMap <String, HashMap<String,String>>  dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	TypeReference<HashMap <String, HashMap<String,String>>> reference
		                      = new TypeReference<HashMap <String, HashMap<String,String>>> (){};
	try
	{
		ObjectMapper mapper = new ObjectMapper();
	dict_aa = mapper.readValue(json_str, reference);
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

	ObjectMapper mapper = new ObjectMapper();

	try
		{
			str_json = mapper.writeValueAsString(dict_aa);
		}
	catch	(Exception ee)
		{
		ee.printStackTrace ();
		}

	return	str_json;
}

// -----------------------------------------------------------------------
static String unit_json_gen_proc 
	(HashMap <String,String> unit_aa)
//	(String name_in,int population_in,String date_mod_in)
{
	String str_json = "";
/*
	HashMap <String,String> unit_aa
				= new HashMap <String,String> ();

	String str_population = Integer.toString (population_in);

	unit_aa.put ("name",name_in);
	unit_aa.put ("population",str_population);
	unit_aa.put ("date_mod",date_mod_in);
*/
	ObjectMapper mapper = new ObjectMapper();

	try
		{
		str_json = mapper.writeValueAsString(unit_aa);
		}
	catch	(Exception ee)
		{
		ee.printStackTrace ();
		}

	return	str_json;
}

// -----------------------------------------------------------------------
static HashMap <String,String> unit_json_parser (String str_json)
{
	HashMap <String,String>  unit_aa
		= new  HashMap<String,String> ();

	TypeReference<HashMap<String,String>> reference = new TypeReference<HashMap<String,String>> (){};

	ObjectMapper mapper = new ObjectMapper();
	try
		{
		unit_aa = mapper.readValue(str_json, reference);
		}
	catch	(Exception ee)
		{
		ee.printStackTrace ();
		}

	return	unit_aa;
}
// -----------------------------------------------------------------------
}

// -----------------------------------------------------------------------
