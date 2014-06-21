<?php
// --------------------------------------------------------------------
/*
	epub_manipulate.php

					Aug/20/2013

*/
// --------------------------------------------------------------------
function epub_to_dict_proc ($file_epub)
{
$command = "java -jar /var/www/data_base/common/jar/tika-app-1.0.jar -t ";
$command .= $file_epub;
$command .= " | awk '{if (substr($1,0,1) == \"t\")print $0}'";
// print	$command . "\n";

$handle = popen ($command,'r');
$str_in = fread($handle, 2048);
pclose($handle);

$dict_aa = str_to_dict_proc ($str_in);

return	$dict_aa;
}

// --------------------------------------------------------------------
function dict_to_epub_proc ($dict_aa,$file_epub)
{
	$file_tmp = "/tmp/tmp002914.txt";
	text_write_proc ($file_tmp,$dict_aa);

	$command = "ebook-convert " . $file_tmp . " " . $file_epub;

	system ($command);

	unlink ($file_tmp);
}

// --------------------------------------------------------------------
?>
