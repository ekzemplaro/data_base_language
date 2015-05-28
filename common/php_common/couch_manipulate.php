<?php
// --------------------------------------------------------------------
//	php_common/couch_manipulate.php
//
//						May/06/2015
//
//
// --------------------------------------------------------------------
function couch_to_dict_proc ($url_collection)
{
	$dict_aa = array ();

	$url_all_docs = $url_collection . "/_all_docs?include_docs=true";

	$json_string = curl_get_proc ($url_all_docs);

	$list_aa = json_decode ($json_string,true);

	$rows = $list_aa['rows'];

	foreach ($rows as $unit)
		{
		$key = $unit['key'];
		$unit_aa = $unit['doc'];

		$dict_aa = dict_append_proc ($dict_aa,$key,$unit_aa['name']
			,$unit_aa['population'],$unit_aa['date_mod']);
		}

	return $dict_aa;
}

// --------------------------------------------------------------------
?>
