<?php
echo "<html>";
echo '<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />';
echo "<body>";
echo "*** start *** <p />";
echo "test_a004.php<p />";
echo "<h2>テスト</h2>";
echo "ファイルの読み込み<p />";
//
$file_in = "ex01.txt";
$str_in = file_get_contents($file_in);
echo $str_in . "<p />";
//
echo "*** end *** <p />";
echo "</body>";
echo "</html>";
?>
