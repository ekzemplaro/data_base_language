// --------------------------------------------------------------------
/*
	json_manipulate.boo

				Jul/30/2014


*/
// --------------------------------------------------------------------
namespace json_manipulate

import	Newtonsoft.Json
// --------------------------------------------------------------------
def json_to_dict_proc (str_json as string):
	print '*** json_to_dict_proc *** aaa'
	print str_json
	dict_aa as System.Collections.Hashtable
	print '*** json_to_dict_proc *** bbb'
	dict_bb as System.Collections.Hashtable = JsonConvert.DeserializeObject  \
		(str_json) as System.Collections.Hashtable
	print '*** json_to_dict_proc *** ccc'

	print dict_bb
	for key in dict_bb.Keys:
		print '*** json_to_dict_proc *** ddd'
		print key
		if ((key != "_id") and (key != "_rev")):
			unit_aa as System.Collections.Hashtable \
				= JsonConvert.DeserializeObject \
					(dict_bb[key])

			dict_aa = text_manipulate.dict_append_proc \
				(dict_aa,key,unit_aa["name"], \
					int.Parse (unit_aa["population"]), \
					unit_aa["date_mod"])
		else:
			dict_aa[key] = dict_bb[key]


	return	dict_aa

// --------------------------------------------------------------------
