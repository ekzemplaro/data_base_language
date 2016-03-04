// --------------------------------------------------------------
//	Xml_manipulate.hx
//
//						Feb/11/2016
// --------------------------------------------------------------
class Xml_manipulate
// --------------------------------------------------------------
{
// --------------------------------------------------------------
public static function xml_to_dict_proc (str_xml: String) :
	Map <String,Map<String,String>>
{
	var dict_aa = new Map ();

	var xml:Xml = Xml.parse(str_xml).firstElement();

	for (elt in xml.elements())
		{
		var key: String = elt.nodeName;

		var unit_aa = new Map ();

		for (elt2 in elt.elements())
			{
			unit_aa.set (elt2.nodeName,elt2.firstChild().nodeValue);
			}

		dict_aa.set (key,unit_aa);
		}

	return	dict_aa;
}

// --------------------------------------------------------------
public static function dict_to_xml_proc (dict_aa:Map <String,Map<String,String>>) : String
{
	var root = Xml.createElement('root');

	for (key in dict_aa.keys ())
		{
		var unit_aa = dict_aa.get (key);
		var child:Xml = Xml.createElement(key); 
		var name:Xml = Xml.createElement('name');
		var population:Xml = Xml.createElement('population');
		var date_mod:Xml = Xml.createElement('date_mod');
		var nn = unit_aa.get ("name");
		var pp = unit_aa.get ("population");
		var dd = unit_aa.get ("date_mod");
		name.addChild(Xml.createPCData(nn));
		population.addChild(Xml.createPCData(pp));
		date_mod.addChild(Xml.createPCData(dd));
		child.addChild (name);
		child.addChild (population);
		child.addChild (date_mod);
		root.addChild(child);
		}


	var str_out = '<?xml version="1.0"?>' + root.toString ();

	return	str_out;
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
