<?php
// ---------------------------------------------------------------------
//	jquery_firebird_create.php
//
//					May/30/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "firebird_row_update.php";
//
// ---------------------------------------------------------------------
define("DBNAME","localhost:/var/tmp/firebird/cities.fdb");
define("DBUSER","sysdba");
define("DBPASS","tiger");

$dbh = ibase_connect(DBNAME,DBUSER,DBPASS,"UTF-8");

firebird_drop_table_proc ($dbh);
firebird_create_table_proc ($dbh);


firebird_insert_proc ($dbh,'t3821','松山',74200,'2002-11-17');
firebird_insert_proc ($dbh,'t3822','今治',54700,'2002-10-19');
firebird_insert_proc ($dbh,'t3823','宇和島',23400,'2002-8-17');
firebird_insert_proc ($dbh,'t3824','八幡浜',74600,'2002-6-18');
firebird_insert_proc ($dbh,'t3825','新居浜',62700,'2002-4-24');
firebird_insert_proc ($dbh,'t3826','西条',42800,'2002-8-21');
firebird_insert_proc ($dbh,'t3827','大洲',36400,'2002-5-8');
firebird_insert_proc ($dbh,'t3828','伊予',83900,'2002-1-21');
firebird_insert_proc ($dbh,'t3829','西予',61700,'2002-2-12');

ibase_close($dbh);

// --------------------------------------------------------------------



// header("Content-Type: text/javascript; charset=utf-8");
// header("Content-Type: text/json; charset=utf-8");

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
