<?php
header("Content-Type: text/html; charset=UTF-8");
// -------------------------------------------------------------------
$IP = $_SERVER['REMOTE_ADDR'];
echo "あなたのホスト名：" . gethostbyaddr($IP) . '<br />';

$out_str = value_get_proc ();

echo $out_str;


// -------------------------------------------------------------------
function value_get_proc ()
{
	echo '*** value_get_proc ***<p />';

	$today = date ("Y-m-d H:i");
	echo $today . '<br />';

	$remote_addr = $_SERVER['REMOTE_ADDR'];
//	$remote_addr = getenv('REMOTE_ADDR');
	echo $remote_addr . '<br />';

	$brws = $_SERVER['HTTP_USER_AGENT'];
	echo $brws . '<br />';

//	$host = gethostbyaddr($remote_addr);
//	echo $host . '<br />;
echo "your host：" . gethostbyaddr($remote_addr) . '<br />';


	$out_str = $today . "\t" . $remote_addr . "\t" . $brws . "\n";

	return $out_str;

}

// -------------------------------------------------------------------
?> 
