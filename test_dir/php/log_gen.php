<?php
// ------------------------------------------------------------------
//	log_gen.php
//
//					Nov/02/2015
//
// ------------------------------------------------------------------

// $file_out = '/var/tmp/logs/log.txt';
$file_out = 'data/log.txt';
// $file_out = 'logs/log.txt';

write_proc ($file_out);

// $data_out = file_get_contents ($file_out);
$arry = file ($file_out);

$nn=count ($arry);

$out_str = "<table>";

$day_current = "";
for ($it=$nn-1; 0<= $it; $it--)
	{
	$line = $arry[$it];
	$mtx = explode ("\t",rtrim ($line));
	$ddx = substr ($mtx[0],0,10);
	if ($ddx != $day_current)
		{
		$out_str .= "<tr><td><br /></td><td><b>";
		$out_str .= $ddx . "</b></td></tr>";
		$day_current = $ddx;
		}
	$out_str .= "<tr><td>";
	$out_str .= $mtx[0] . "</td><td>";
	$out_str .= $mtx[1] . "</td><td>";
	$out_str .= $mtx[2] . "</td>";
	$out_str .= "</tr>";
	}

$out_str .= "</table>";

echo $out_str;

// ------------------------------------------------------------------
function write_proc ($file_out)
{
	$IP = $_SERVER['REMOTE_ADDR'];
	$hostname=gethostbyaddr($IP);
	$brws = $_SERVER['HTTP_USER_AGENT'];
	date_default_timezone_set('Asia/Tokyo');
	$today = date ("Y-m-d H:i");
	$out_str = $today . "\t" . $hostname . "\t" . $brws . "\n";

	$fp = fopen ($file_out,'a');
	flock ($fp,LOCK_EX);
	fputs ($fp,$out_str);
	flock ($fp,LOCK_UN);
	fclose ($fp);

}

// ------------------------------------------------------------------
?> 
