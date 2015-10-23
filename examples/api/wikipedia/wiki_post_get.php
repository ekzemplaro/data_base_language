<?php
// ---------------------------------------------------------------------
//	http://localhost/test/api/wikipedia/wiki_get.php?id=b1127
//	curl -F "id=b1234" http://localhost/data_base/examples/api/wikipedia/wiki_post_get.php
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
// ---------------------------------------------------------------------
//
// echo "Hello<p />";
// echo "Good Morning<p />";

echo $_POST["id"];

//$id = $_GET["id"];

$url_in = 'http://localhost:5984/wikipedia';

// $json_string = curl_get_proc ($url_in . "/" . $id);

// echo $json_string;

// ---------------------------------------------------------------------
?>	
