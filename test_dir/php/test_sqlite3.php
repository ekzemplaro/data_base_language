<?php
// ------------------------------------------------------------------
// ------------------------------------------------------------------
function disp_lower_proc ($dbh)
{
echo '<pre>';
try{
	$sql = 'select * from cities order by id';
	foreach ($dbh->query($sql) as $row)
		{
		print ($row['id'] . "\t");
		print ($row['name'] . "\t");
		print ($row['population'] . "\t");
		print ($row['date_mod'] . "\n");
		}
}catch (PDOException $e){
    print('Error:'.$e->getMessage());
    die();
}

echo '</pre>';
}

// ------------------------------------------------------------------
ini_set("display_errors", 1);
error_reporting(E_ALL);

echo "<html>";
echo '<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />';
echo "<body>";
echo "*** start *** <p />";
echo "test_a004.php<p />";
echo "<h2>テスト</h2>";
echo "Sqlite3 ファイルの読み込み<p />";
//
$sqlite3_file = "cities.db";
$dbcon = new PDO ("sqlite:" . $sqlite3_file);

disp_lower_proc ($dbcon);

$dbcon=null;
//
echo "*** end *** <p />";
echo "</body>";
echo "</html>";
// ------------------------------------------------------------------
?>
