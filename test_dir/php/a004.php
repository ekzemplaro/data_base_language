<?php
header("Content-Type: text/html; charset=UTF-8");
$IP = $_SERVER['REMOTE_ADDR'];
echo "あなたのホスト名：".gethostbyaddr($IP) . '<br />';


$IP = $_SERVER['REMOTE_ADDR'];
$hostname=gethostbyaddr($IP);
echo "あなたのホスト名：". $hostname . '<br />';

	echo '*** log_out_proc *** start<p />';

$today = date ("Y-m-d H:i");

$brws = $_SERVER['HTTP_USER_AGENT'];

$out_str = $today . "\t" . $hostname . "\t" . $brws . "\n";

	$file_out = '/var/tmp/logs/log_dd.txt';

	$fp = fopen ($file_out,'a');
	flock ($fp,LOCK_EX);
	fputs ($fp,$out_str);
	flock ($fp,LOCK_UN);
	fclose ($fp);

	echo '*** log_out_proc *** end<p />';
?> 
