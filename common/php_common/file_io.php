<?php
// ------------------------------------------------------------------
//	/data_base/common/php_common/file_io.php
//
//					Jun/13/2011
//
// ------------------------------------------------------------------
function file_write_proc ($string_out,$file_out)
{
	$fp_out=fopen ($file_out,"w");
	flock ($fp_out,LOCK_EX);
	fputs ($fp_out,$string_out);
	flock ($fp_out,LOCK_UN);
	fclose ($fp_out);
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
?>
