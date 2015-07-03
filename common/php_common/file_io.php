<?php
// ------------------------------------------------------------------
//	/data_base/common/php_common/file_io.php
//
//					Jun/24/2015
//
// ------------------------------------------------------------------
function file_write_proc ($string_out,$file_out)
{
	$fp_out=fopen ($file_out,"w");
	flock ($fp_out,LOCK_EX);
	fputs ($fp_out,$string_out);
	flock ($fp_out,LOCK_UN);
	fclose ($fp_out);

	chmod ($file_out,0666);
}

// ------------------------------------------------------------------
function dump_proc ($data_in,$file_out)
{
	ob_start ();
	var_dump ($data_in);
	$out = ob_get_contents ();
	ob_end_clean ();
//	file_put_contents ($file_out,$out,FILE_APPEND);
	file_put_contents ($file_out,$out);
}

// ------------------------------------------------------------------
function folder_create_proc ($file_out)
{
	$path_parts = pathinfo ($file_out);

	$folder=$path_parts['dirname'];
	echo $folder, "\n";

	if (file_exists($folder)) {
		echo "$folder が存在します\n";
	} else {
		echo "$folder は存在しません\n";

		mkdir ($folder, 0777);
		chmod ($folder, 0777);
		}
}

// ------------------------------------------------------------------
?>
