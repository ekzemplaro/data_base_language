#! /usr/bin/php
<?php
//
//	sqlite3_create.php
//
//					Sep/13/2011
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "sql_display.php";
include "sql_manipulate.php";
// ----------------------------------------------------------------
print "*** 開始 ***\n";

$file_out = $argv[1];
print	$file_out . "\n";

$dbcon = new PDO ("sqlite:" . $file_out);


drop_table_proc ($dbcon);
create_table_proc ($dbcon);


insert_proc ($dbcon,'t0711','郡山',49315,'2002-3-27');
insert_proc ($dbcon,'t0712','会津若松',78672,'2002-6-14');
insert_proc ($dbcon,'t0713','白河', 83246,'2002-5-27');
insert_proc ($dbcon,'t0714','福島', 51847,'2002-7-18');
insert_proc ($dbcon,'t0715','喜多方', 79621,'2002-8-24');
insert_proc ($dbcon,'t0716','二本松', 38548,'2002-9-23');
insert_proc ($dbcon,'t0717','いわき', 24763,'2002-5-17');
insert_proc ($dbcon,'t0718','相馬', 74815,'2002-5-4');
insert_proc ($dbcon,'t0719','須賀川', 57249,'2002-10-24');


disp_lower_proc ($dbcon);

print "*** 終了 ***\n";
?>

