<?php
// ------------------------------------------------------------------
//	xml_manipulate.php
//
//					Oct/13/2011
//
// ------------------------------------------------------------------
function xml_to_dict_proc ($xml_string)
{
	$root = simplexml_load_string ($xml_string);

	$dict_aa = array ();

	foreach ($root as $key => $city)
		{
		$dict_aa = dict_append_proc
			($dict_aa,$key,$city->name,$city->population,$city->date_mod);
		}

	return	$dict_aa;
}

// ------------------------------------------------------------------
function dict_to_xml_proc ($dict_aa)
{
	$data= new SimpleXMLElement ("<root></root>");

	foreach ($dict_aa as $key => $value)
		{
		$name = $value['name'];
		$population = $value['population'];
		$date_mod = $value['date_mod'];

		$data = xml_addchild_proc ($data,$key,$name,$population,$date_mod);

		$str_xml = $data->asXML ();
		}

	return $str_xml;
}

// ------------------------------------------------------------------
function xml_addchild_proc ($data,$id_in,$name_in,$population_in,$date_mod_in)
{
	$obj = $data->addChild ($id_in,"");
	$obj2 = $obj->addChild ("name",$name_in);
	$obj2 = $obj->addChild ("population",$population_in);
	$obj2 = $obj->addChild ("date_mod",$date_mod_in);

	return	$data;
}
// ------------------------------------------------------------------
?>
