#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	read/neo4j_read.php
//
//					Aug/30/2012
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
// ------------------------------------------------------------------
function row_parser ($key)
{
	$url_in = 'http://localhost:7474/db/data/node/' . $key . '/properties';
#	print	"url_in = " .$url_in . "\n";

	$json_string = curl_get_proc ($url_in);

#print	$json_string;

	$root = json_decode ($json_string);

	if (array_key_exists ("id",$root))
		{
	print $root->id . "\t";
	print $root->name . "\t";
	print $root->population . "\t";
	print $root->date_mod . "\n";
		}
}

// ------------------------------------------------------------------
print	"*** 開始 ***\n";

for ($key=1; $key < 10; $key++)
	{
	row_parser ($key);
	}

print	"*** 終了 ***\n";

// ------------------------------------------------------------------
?>
