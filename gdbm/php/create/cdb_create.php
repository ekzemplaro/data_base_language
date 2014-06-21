#! /usr/bin/php
<?
// ------------------------------------------------------------------
//	cdb_create.php
//
//					Mar/27/2013
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "dba_manipulate.php";

// ------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t2761','豊中',51436,'2002-7-24');
$dict_aa = dict_append_proc ($dict_aa,'t2762','池田',47381,'2002-2-8');
$dict_aa = dict_append_proc ($dict_aa,'t2763','高槻',82946,'2002-3-15');
$dict_aa = dict_append_proc ($dict_aa,'t2764','吹田',46321,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t2765','茨木',35769,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t2766','摂津',24683,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t2767','泉大津',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t2768','和泉',91578,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t2769','高石',79461,'2002-7-8');

	return	$dict_aa;
}
// ------------------------------------------------------------------

print "*** 開始 ***\n";
$file_cdb=$argv[1];
print $file_cdb . "\n";

$dict_aa = data_prepare_proc ();

$dbh = dba_open($file_cdb,"w","cdb");

foreach ($dict_aa as $key => $value)
	{
	$str_json = json_encode ($value);
	dba_insert($key,$str_json,$dbh);
	}

dba_close ($dbh);
#
print "*** 終了 ***\n";
// ------------------------------------------------------------------
?> 
