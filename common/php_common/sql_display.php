<?php
// --------------------------------------------------------------------
//
//	sql_display.php
//
//
//					Feb/05/2010
//
//
// --------------------------------------------------------------------
function disp_upper_proc ($dbcon)
{
$sql = 'select * from cities order by ID';


print ("*** disp_upper_proc check ***\n");

foreach ($dbcon->query($sql) as $row)
	{
	$id = $row['ID'];
	$name = $row['NAME'];
	$population = $row['POPULATION'];
	$date_mod = $row['DATE_MOD'];

	$str_out =  $id . "\t" . $name . "\t" . $population . "\t" . $date_mod;
	print $str_out . "\n";
	}
}

// --------------------------------------------------------------------
function disp_lower_proc ($dbh)
{
print ("*** disp_lower_proc check ***\n");

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

$dbh = null;
}

// ---------------------------------------------------------------------
?>	
