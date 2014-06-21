<?php
// --------------------------------------------------------------------
//	php_common/couch_manipulate.php
//
//					Sep/17/2012
//
//
// --------------------------------------------------------------------
function delete_all_proc ($url_collection)
{
$url_target = $url_collection . "/cities";

print	"url_target = " .$url_target . "\n";

$json_list = curl_get_proc ($url_collection . "/_all_docs");

$root=json_decode ($json_list);

echo $root->total_rows . "\n";

foreach ($root->rows as $record)
	{
	if ($record->id == "cities")
		{
		echo $record->id . "\t";
		echo $record->value->rev . "\t";
		echo "\n";
		$url_delete = $url_target . "?rev=" . $record->value->rev;
		curl_delete_proc ($url_delete);

		echo $url_delete . " *** deleted\n";
		break;
		}
	}

}

// --------------------------------------------------------------------
?>
