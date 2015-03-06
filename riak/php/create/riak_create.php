#! /usr/bin/php
<?php
//
//	riak_create.php
//
//					Feb/09/2015
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "curl_get.php";
// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t3251','松江',61437,'2002-3-21');
$dict_aa = dict_append_proc ($dict_aa,'t3252','出雲',73219,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t3253','大田',58291,'2002-9-28');
$dict_aa = dict_append_proc ($dict_aa,'t3254','雲南',32975,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t3255','江津',37542,'2002-7-15');
$dict_aa = dict_append_proc ($dict_aa,'t3256','浜田',24697,'2002-12-12');
$dict_aa = dict_append_proc ($dict_aa,'t3257','益田',82157,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t3258','安来',96571,'2002-3-24');

	return	$dict_aa;
}

// ----------------------------------------------------------------
print	"*** 開始 ***\n";


$dict_aa = data_prepare_proc ();

foreach ($dict_aa as $key => $value)
	{
	$url_city = 'http://host_ubuntu1:8098/riak/shimane/' . $key;
	$str_json = json_encode ($value);

	curl_put_proc ($url_city,$str_json);
	}

print	"*** 終了 ***\n";
?>
