<?php
// ---------------------------------------------------------------------
//	sqlite3_php_create.php
//
//					Jun/15/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "sql_display.php";
include "sql_manipulate.php";
//
// ---------------------------------------------------------------------
$sqlite3_file = "/var/tmp/sqlite3/cities.db";

print	"aaaa ***" . "\n";
print	$sqlite3_file . "\n";

$dbcon = new PDO ("sqlite:" . $sqlite3_file);


drop_table_proc ($dbcon);
create_table_proc ($dbcon);


insert_proc ($dbcon,'t0711','郡山',41300,'2002-3-27');
insert_proc ($dbcon,'t0712','会津若松',75200,'2002-6-14');
insert_proc ($dbcon,'t0713','白河', 84300,'2002-5-27');
insert_proc ($dbcon,'t0714','福島', 52700,'2002-7-18');
insert_proc ($dbcon,'t0715','喜多方', 14900,'2002-8-24');
insert_proc ($dbcon,'t0716','二本松', 34500,'2002-9-23');
insert_proc ($dbcon,'t0717','いわき', 34700,'2002-5-17');
insert_proc ($dbcon,'t0718','相馬', 34800,'2002-5-4');
insert_proc ($dbcon,'t0719','須賀川', 54200,'2002-10-24');

$dbcon = null;

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
