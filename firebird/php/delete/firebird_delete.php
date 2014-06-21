#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	data_base/firebird/php/delete/firebird_delete.php
//
//					Nov/11/2010
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "firebird_display.php";
include "firebird_row_update.php";
// ------------------------------------------------------------------
print	"*** 開始 ***\n";

$id_in = $argv[1];

print	$id_in . "\n";

define("DBNAME","localhost:/var/tmp/firebird/cities.fdb");
define("DBUSER","sysdba");
define("DBPASS","tiger");

$dbh = ibase_connect(DBNAME,DBUSER,DBPASS,"UTF-8");
if ($dbh == FALSE)
{
	echo 'データベースと接続できません。\n';
}
else
{
	print 'データベースとの接続に成功しました。' . "\n";

	firebird_row_delete_proc ($dbh,$id_in);

	firebird_display_proc ($dbh);
    	ibase_close($dbh);
}

print	"*** 終了 ***\n";
// ------------------------------------------------------------------
?>
