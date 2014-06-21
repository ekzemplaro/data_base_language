<?php
// ---------------------------------------------------------------------
//	postgre_php_create.php
//
//					Jan/07/2013
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "sql_display.php";
include "sql_manipulate.php";
//
// ---------------------------------------------------------------------
$dsn = 'pgsql:dbname=city host=localhost port=5432';
$user = 'scott';
$password = 'tiger';

$dbcon = new PDO ($dsn, $user,$password);

drop_table_proc ($dbcon);
create_table_proc ($dbcon);

insert_proc ($dbcon,'t3461','広島',57400,'2002-5-21');
insert_proc ($dbcon,'t3462','福山',74200,'2002-6-17');
insert_proc ($dbcon,'t3463','東広島', 86100,'2002-5-26');
insert_proc ($dbcon,'t3464','呉', 51300,'2002-7-18');
insert_proc ($dbcon,'t3465','尾道', 14800,'2002-8-24');
insert_proc ($dbcon,'t3466','竹原', 34500,'2002-9-23');
insert_proc ($dbcon,'t3467','三次', 71600,'2002-5-17');
insert_proc ($dbcon,'t3468','大竹', 48100,'2002-5-4');
insert_proc ($dbcon,'t3469','府中', 75400,'2002-10-15');

$dbcon = null;
// --------------------------------------------------------------------



// header("Content-Type: text/javascript; charset=utf-8");
// header("Content-Type: text/json; charset=utf-8");

print "*** OK ***";

// ---------------------------------------------------------------------
?>	
