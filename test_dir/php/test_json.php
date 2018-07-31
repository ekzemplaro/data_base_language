<?php
// ------------------------------------------------------------------
// require "/var/tmp/json";
// ------------------------------------------------------------------
function disp_proc ($dict_aa)
{
echo '<pre>';
foreach ($dict_aa as $key => $value)
	{
	print ($key . "\t");
	print ($value['name'] . "\t");
	print ($value['population'] . "\t");
	print ($value['date_mod'] . "\n");
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
echo "test_json.php<p />";
echo "<h2>テスト</h2>";
echo "JSON ファイルの読み込み<p />";
//
$json_filename = "cities.json";

$json_string = file_get_contents ($json_filename);
$dict_aa = json_decode ($json_string,true);


disp_proc ($dict_aa);


//
echo "*** end *** <p />";
echo "</body>";
echo "</html>";
// ------------------------------------------------------------------
?>
