<?php
echo '*** start ***<br />';
$dsn = 'mysql:dbname=TRCZYgUDnM219;host=localhost';
// $dsn = 'mysql:dbname=rentacar-guam_2012;host=localhost:/var/lib/mysql/mysql.sock';
//
$config = array ();
$config['username'] = 'TRCZYgUDnM219';
$config['password'] = 'Rentacar00Pass';
// $config['username'] = 'rentacar-guam';
// $config['password'] = 'racguam!2012!';
//
$dbcon = new PDO($dsn, $config['username'], $config['password']);
try
{
// $sql = 'select *  from `cms_car_model';
// $sql = 'select *  from `cms_car_model';
$sql = 'select *  from `table_test';
foreach ($dbcon->query($sql) as $row)
	{
	print $row[0] . "<br />";
	print $row[1] . "<br />";
	print $row[2] . "<br />";
	}
}
catch (PDOException $e){
    print('Error:'.$e->getMessage());
    die();
}

$dbcon = null;
echo '*** end ***<br />';
?>
