// ------------------------------------------------------------------
//	exist_update.boo
//
//					Oct/03/2011
//
// ------------------------------------------------------------------
import System

// ------------------------------------------------------------------
id_in = argv[0]
population_in = int.Parse (argv[1])

print id_in,population_in


url = "http://localhost:8086/exist/rest/db/cities/cities.xml"

user=""
password=""


str_xml = get_uri.get_uri_proc (url,user,password)

dict_aa = xml_to_dict_proc (str_xml)

dict_update_proc (dict_aa,id_in,population_in)

dict_display_proc (dict_aa)

xml_str = dict_to_xml_proc (dict_aa)

get_uri.put_uri_string_proc (url,xml_str,user,password)

print '*** 終了 ***'

// ------------------------------------------------------------------
