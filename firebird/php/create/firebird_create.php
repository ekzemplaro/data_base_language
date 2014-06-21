#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	firebird_create.php
//
//					May/09/2013
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "firebird_display.php";
include "firebird_row_update.php";
// ------------------------------------------------------------------
print	"*** 開始 ***\n";


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

	firebird_drop_table_proc ($dbh);
	firebird_create_table_proc ($dbh);


	firebird_insert_proc ($dbh,'t3821','松山',75428,'2002-3-27');
	firebird_insert_proc ($dbh,'t3822','今治',54715,'2002-7-9');
	firebird_insert_proc ($dbh,'t3823','宇和島',23458,'2002-8-17');
	firebird_insert_proc ($dbh,'t3824','八幡浜',74682,'2002-6-18');
	firebird_insert_proc ($dbh,'t3825','新居浜',62541,'2002-4-24');
	firebird_insert_proc ($dbh,'t3826','西条',46957,'2002-8-21');
	firebird_insert_proc ($dbh,'t3827','大洲',37516,'2002-5-8');
	firebird_insert_proc ($dbh,'t3828','伊予',82592,'2002-10-1');
	firebird_insert_proc ($dbh,'t3829','西予',61745,'2002-12-12');

	firebird_display_proc ($dbh);
   	ibase_close($dbh);
}

print	"*** 終了 ***\n";
// ------------------------------------------------------------------
?>
