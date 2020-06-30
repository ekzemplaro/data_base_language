<?php
// -----------------------------------------------------------------
echo "<html>";
echo '<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />';
echo "<body>";
echo "test_args.php<p />";
echo "<h2>テスト</h2>";
$in_vars = "";
// while (list($key, $val) = each($HTTP_GET_VARS)) {
while (list($key, $val) = each($_GET)) {
	$in_vars	.= $key."=".$val. "<p />";
}
echo $in_vars;
echo "Jun/28/2020<p />";
echo "</body>";
echo "</html>";
// -----------------------------------------------------------------
?>
