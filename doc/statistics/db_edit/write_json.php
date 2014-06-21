<?php
// ------------------------------------------------------------------
//	write.php
//
//				Jul/17/2012
// ------------------------------------------------------------------
$file_json = $_POST["file"];
$textfile = fopen($file_json, "w");
fputs($textfile, $_POST["data_out"]);
fclose($textfile);
$out_str = "*** OK ***";

echo $out_str;
?>
