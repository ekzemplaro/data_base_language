<?php
// ------------------------------------------------------------------
//	couchdb_update.php
//
//				Sep/05/2011
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"curl_get.php";

// ------------------------------------------------------------------

// echo "*** from couchdb_update.php *** start Aug/29/2011 ***<p />";

cgi_manipulate ();


// echo "*** from couchdb_update.php *** end Aug/29/2011 ***<p />";

// ------------------------------------------------------------------
function cgi_manipulate ()
{
$arry_param = array ();

if (isset ($_REQUEST['my_data']))
	{
	$out_str = "";
	$count = 0;
	$json_received = $_REQUEST['my_data'];

//	echo "--- json_received ---<br />";
//	echo $json_received;
//	echo "--------<br />";

	$root=json_decode ($json_received);

	$id_target = $root->_id;

//	echo $id_target . "<br />";
//	echo "--------<br />";

	$url_target = "http://localhost:5984/city/" . $id_target;

	curl_put_proc ($url_target,$json_received);

//	echo "*** OK ***";
	}
else
	{
	echo "*** NG ***";
	}

}

// ------------------------------------------------------------------
?>

