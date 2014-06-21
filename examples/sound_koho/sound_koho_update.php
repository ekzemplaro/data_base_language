<?php
// ------------------------------------------------------------------
//	sound_koho_update.php
//
//					Oct/28/2011
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"curl_get.php";
include	"file_io.php";

// ------------------------------------------------------------------


//$tmp_str = "*** from sound_koho_update.php *** start Oct/28/2011 ***\n";
//file_write_proc ($tmp_str,"/tmp/t0005.txt");

cgi_manipulate ();


//$tmp_str_bb = "*** from sound_koho_update.php *** end Oct/28/2011 ***\\";

//file_write_proc ($tmp_str_bb,"/tmp/t0006.txt");

// ------------------------------------------------------------------
function cgi_manipulate ()
{
$arry_param = array ();

if (isset ($_REQUEST['my_data']))
	{
	$out_str = "";
	$count = 0;
	$json_received = $_REQUEST['my_data'];

// file_write_proc ($json_received,"/tmp/t0007.txt");

//	echo "--- json_received ---<br />";
//	echo $json_received;
//	echo "--------<br />";

	$root=json_decode ($json_received);

	$id_target = $root->_id;

//	echo $id_target . "<br />";
//	echo "--------<br />";

	$url_target = "http://localhost:5984/sound_koho/" . $id_target;

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

