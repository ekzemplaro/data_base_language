<?php

	echo '*** start ***<p />';

	$brws = $_SERVER['HTTP_USER_AGENT'];

	echo $brws . '<br />';

	$remote = getenv('REMOTE_ADDR');

	echo '*** ppp ***<p />';

	echo $remote . '<br />';
	echo '*** qqq ***<p />';

//	$host = gethostbyaddr($remote);

//	echo $host . '<br />;

	echo '*** end ***<p />';
?>
