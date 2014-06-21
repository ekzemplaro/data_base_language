#! /usr/bin/php
<?php
//
//	postgre_create.php
//
//					Jun/13/2011
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "sql_display.php";
include "sql_manipulate.php";
// ----------------------------------------------------------------
print "*** 開始 ***\n";

$dsn = 'pgsql:dbname=city host=localhost port=5432';

$user = 'scott';
$password = 'tiger';

$dbcon = new PDO ($dsn, $user,$password);


drop_table_proc ($dbcon);
create_table_proc ($dbcon);


insert_proc ($dbcon,'t3461','広島',91475,'2002-3-24');
insert_proc ($dbcon,'t3462','福山',67396,'2002-6-14');
insert_proc ($dbcon,'t3463','東広島', 38742,'2002-5-27');
insert_proc ($dbcon,'t3464','呉', 51267,'2002-7-18');
insert_proc ($dbcon,'t3465','尾道', 89746,'2002-8-24');
insert_proc ($dbcon,'t3466','竹原', 34591,'2002-9-23');
insert_proc ($dbcon,'t3467','三次', 72684,'2002-5-17');
insert_proc ($dbcon,'t3468','大竹', 48173,'2002-7-4');
insert_proc ($dbcon,'t3469','府中', 75432,'2002-10-15');


// disp_upper_proc ($dbcon);
disp_lower_proc ($dbcon);

$dbcon = null;

print "*** 終了 ***\n";
?>

