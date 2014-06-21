#! /usr/bin/php
<?php
// --------------------------------------------------------------------
//
//	xml_to_json.php
//
//						Apr/03/2012
//
// --------------------------------------------------------------------
$file_xml = $argv[1];
$pointer=fopen ($file_xml,"r");
$xml_string = "";
while (!feof ($pointer))
	{
	$ss = fgets ($pointer);
	$xml_string = $xml_string . $ss;
	}

fclose ($pointer); 

$xml = simplexml_load_string ($xml_string);

// echo '<pre>';
// var_dump( $xml );
// echo '</pre>';


echo json_encode ($xml);

// --------------------------------------------------------------------
?>

