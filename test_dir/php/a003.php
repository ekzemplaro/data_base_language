<?php

function log_out_proc ($out_str)
{
	echo '*** log_out_proc ***<p />';
	echo $out_str . '<p />';

	$file_out = '/var/tmp/logs/log.txt';
//	$file_out = './log.txt';

	$fp = fopen ($file_out,'a');
	flock ($fp,LOCK_EX);
	fputs ($fp,$out_str);
	flock ($fp,LOCK_UN);
	fclose ($fp);
	echo '*** log_out_proc *** end<p />';
}

// -------------------------------------------------------------------
function value_get_proc ()
{
	echo '*** value_get_proc *** start ***<p />';

	$today = date ("Y-m-d H:i");
	echo $today . '<br />';

	$remote_addr = $_SERVER['REMOTE_ADDR'];
//	$remote_addr = getenv('REMOTE_ADDR');
	echo $remote_addr . '<br />';

	$brws = $_SERVER['HTTP_USER_AGENT'];
	echo $brws . '<br />';

	echo gethostbyaddr($remote_addr) . '<br />';

	$name_host = gethostbyaddr($remote_addr);
//	echo $name_host . '<br />;


	$out_str = $today . "\t" . $remote_addr . "\t" . $brws . "\n";

	echo '*** value_get_proc *** end ***<p />';

	return $out_str;

}
// -------------------------------------------------------------------
	echo '*** start ***<p />';


//	$hostname = gethostbyaddr($_SERVER['REMOTE_ADDR']);

//	echo $hostname . '<p />;

	$out_str = value_get_proc ();

	echo $out_str;

	echo '*** ppp ***<p />';

	log_out_proc ($out_str);

	echo '*** qqq ***<p />';

	echo '*** end ***<p />';
?>
