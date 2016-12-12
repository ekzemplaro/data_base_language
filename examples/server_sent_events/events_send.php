<?php
// -----------------------------------------------------------
//	server_sent_events/events_send.php
//
//					Dec/12/2016
//
// -----------------------------------------------------------
date_default_timezone_set('Asia/Tokyo');

header("Content-Type: text/event-stream\n\n");
header('Cache-Control: no-cache');
header('Content-Encoding: none;');

while (1) {
	$json_filename = "status.json";

	$json_string = file_get_contents ($json_filename);

	$status = json_decode ($json_string,true);
 
	$str_json = json_encode ($status);
	echo 'data: ' . $str_json . "\n\n";
  
	ob_end_flush ();
	flush ();
	sleep (1);
}

// -----------------------------------------------------------
