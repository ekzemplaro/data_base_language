<?php
// ------------------------------------------------------------------
//	write_json.php
//
//				Oct/16/2014
// ------------------------------------------------------------------
$file_json = $_POST["file"];
$textfile = fopen($file_json, "w");
fputs($textfile, $_POST["data_out"]);
fclose($textfile);
$out_str = "*** OK ***";

echo $out_str;
?>
