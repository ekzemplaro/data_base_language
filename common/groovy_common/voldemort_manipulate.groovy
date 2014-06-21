// ---------------------------------------------------------------------
//
//	voldemort_manipulate.groovy
//
//						Sep/09/2013
//
// ---------------------------------------------------------------------
import text_manipulate
import mcached_manipulate

import groovy.json.*
// ---------------------------------------------------------------------
class voldemort_manipulate
{
// ---------------------------------------------------------------------
static voldemort_to_dict_proc (client)
{
	println ("*** voldemort_to_dict_proc *** start ***")

	def dict_aa = new HashMap()

def keys = ["t3051","t3052","t3053",
		"t3054","t3055","t3056",
		"t3057","t3058","t3059"]

keys.each {key ->
	def version = client.get(key)
	

	if (version != null)
	{
	def json_str = version.getValue ()
	def slurper = new JsonSlurper()
	def unit_aa = slurper.parseText (json_str)
	dict_aa = text_manipulate.dict_append_proc (
		dict_aa,key,unit_aa['name'],
			unit_aa['population'],unit_aa['date_mod'])
	}
	}

	return	dict_aa
}

// ---------------------------------------------------------------------
static void  dict_to_voldemort_proc (dict_aa,client)
{
	dict_aa.keySet().each { key ->
		def value = dict_aa[key]

//		println ("key = " + key)

		def json_aa = json_create_proc (value['name'],value['population'],value['date_mod'])

		println key + "\t" + json_aa
		client.put(key, json_aa)
		 }
}

// ---------------------------------------------------------------------
static json_create_proc (name_in,population_in,date_mod_in)
{
	def value  = "{\"name\":\"" + name_in + "\","
	value +=  "\"population\":" + population_in + ","
	value += "\"date_mod\":\"" + date_mod_in + "\"}"

	return	value
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
