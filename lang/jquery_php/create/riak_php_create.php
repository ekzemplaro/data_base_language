<?php
// ------------------------------------------------------------------
//	jquery_php/create/riak_php_create.php
//
//					Mar/12/2013
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "curl_get.php";
include "text_manipulate.php";


// ------------------------------------------------------------------
$dict_aa=data_prepare_proc ();

foreach ($dict_aa as $key => $value)
	{
	$url_city = 'http://localhost:8098/riak/shimane/' . $key;
	$str_json = json_encode ($value);

	curl_put_proc ($url_city,$str_json);
	}

// header ("Content-Type: text/javascript; charset=utf-8");

echo	"*** OK ***";
// ------------------------------------------------------------------
function data_prepare_proc ()
{

	$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t3251','松江',81400,'2002-5-17');
$dict_aa = dict_append_proc ($dict_aa,'t3252','出雲',73200,'2002-4-11');
$dict_aa = dict_append_proc ($dict_aa,'t3253','大田',58200,'2002-6-24');
$dict_aa = dict_append_proc ($dict_aa,'t3254','雲南',32900,'2002-11-29');
$dict_aa = dict_append_proc ($dict_aa,'t3255','江津',37500,'2002-12-14');
$dict_aa = dict_append_proc ($dict_aa,'t3256','浜田',24600,'2002-7-12');
$dict_aa = dict_append_proc ($dict_aa,'t3257','益田',82100,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t3258','安来',92500,'2002-3-24');

	return $dict_aa;
}

// ------------------------------------------------------------------
?>
