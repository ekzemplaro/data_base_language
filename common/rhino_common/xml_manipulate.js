// ------------------------------------------------------------------
//
//	xml_manipulate.js
//
//						Jun/14/2011
//
// ------------------------------------------------------------------
function dict_to_xml_proc (dict_aa)
{
	var str_aa = "<?xml version=\"1.0\"?>";
//	var obj_bb = obj_in['cities'];

//	print	("dict_aa.length = " + dict_aa.length);

	str_aa +=  '<root>\n';
	for (var key in dict_aa)
		{
		str_aa +=  '<' + key + '>';
		str_aa += '<name>' + dict_aa[key].name +'</name>';
		str_aa += '<population>' + dict_aa[key].population +'</population>';
		str_aa += '<date_mod>' + dict_aa[key].date_mod +'</date_mod>';
		str_aa +=  '</' + key + '>\n';
		}

	str_aa +=  '</root>\n';

	return	str_aa;

}

// ------------------------------------------------------------------
function xml_to_dict_proc (xml_str)
{
	print ("xml_to_dict_proc ***");

	var str_in=xml_str.replace('<?xml version="1.0"?>', "");

	str_in=str_in.replace('<?xml version="1.0" encoding="utf-8"?>', "");
	str_in=str_in.replace('<?xml version="1.0" encoding="UTF-8"?>', "");
	str_in=str_in.replace('<?xml version=\'1.0\' encoding=\'UTF-8\'?>', "");
	str_in=str_in.replace('\n','');

// print (str_in);

	var xx_dict = new XML (str_in);

	var dict_aa = new Object ();

	print ("xml_to_dict_proc *** bbbb");
	var it=0;
	for each (var city in xx_dict.*)
		{
// print (city.name);
		dict_aa = dict_append_proc
		(dict_aa,city.name (),city.name,city.population,city.date_mod);
		it++;
		}

	return	dict_aa;
}

// ------------------------------------------------------------------
