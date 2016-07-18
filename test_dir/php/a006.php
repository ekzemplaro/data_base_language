<?php
// -------------------------------------------------------------------
//	a006.php
//
//				Oct/31/2015
// -------------------------------------------------------------------

function log_out_proc ($out_str)
{
//	$file_out = '/var/tmp/logs/log_cc.txt';
	$file_out = 'data/log_cc.txt';

	$fp = fopen ($file_out,'a');
	flock ($fp,LOCK_EX);
	fputs ($fp,$out_str);
	flock ($fp,LOCK_UN);
	fclose ($fp);
}

// -------------------------------------------------------------------
function value_get_proc ()
{
	$today = date ("Y-m-d H:i");

	$remote_addr = getenv('REMOTE_ADDR');

	$brws = $_SERVER['HTTP_USER_AGENT'];

//	$host = gethostbyaddr($remote_addr);
//	echo $host . '<br />;

	$out_str = $today . "\t" . $remote_addr . "\t" . $brws . "\n";

	return $out_str;
}

// -------------------------------------------------------------------
	echo '*** start *** log_gen.php ***<p />';

	$out_str = value_get_proc ();

	echo $out_str . '<p />';

	log_out_proc ($out_str);

	echo '*** end ***<p />';
// -------------------------------------------------------------------
?>
