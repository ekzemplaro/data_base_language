#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	data_base/xml/php/xml_read.php
//
//					Jun/13/2011
//
// ------------------------------------------------------------------

// ------------------------------------------------------------------
$xml_filename = $argv[1];

print	"*** 開始 ***\n";

$xml_string = file_get_contents ($xml_filename);

$root = simplexml_load_string ($xml_string);

foreach ($root->body as $key => $value)
	{
	echo $key;
	echo "\t";
	echo ($value->a[0]);
//	var_dump ($value);
//	echo ($value->h1);
	echo "\n";
	}

print	"---------------------------\n";

foreach ($root->body->children () as $value)
	{
//	var_dump ($value);
//	echo ($value->h1->a);
//	var_dump ($value->a[0]);
	echo ($value->a[0]);
	echo "\t -- \t";
	echo ($value->attributes()->id);
	echo "\t";
	echo ($value->a[0]->attributes()->href);
	echo "\n";
	}



print	"*** 終了 ***\n";
// ------------------------------------------------------------------
?>

