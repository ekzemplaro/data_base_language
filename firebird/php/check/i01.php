#! /usr/bin/php

<?php
// ----------------------------------------------------------------------
include ("sql_display.php");

// ----------------------------------------------------------------------
// DB アカウント定義
define("DBNAME","localhost:/var/tmp/firebird/cities.fdb"); // データベース名
define("DBUSER","SYSDBA");         // 接続ユーザ名
define("DBPASS","hello9");      // パスワード

// DB 接続
$dbh = ibase_connect(DBNAME,DBUSER,DBPASS,"UTF-8");
if ($dbh == FALSE) {
    echo 'データベースと接続できません。<BR>';
} else {
    echo 'データベースとの接続に成功しました。<BR>';



$stmt = 'SELECT * FROM cities';
$sth = ibase_query($dbh, $stmt);
while ($row = ibase_fetch_object($sth)) {
    echo $row->id, "\n";

	$id = $row->ID;
	$name = $row->NAME;
	$population = $row->POPULATION;
	$date_mod = $row->DATE_MOD;

	$str_out =  $id . "\t" . $name . "\t" . $population . "\t" . $date_mod;

	print $str_out; 
}
	print "\n";
 
	ibase_free_result($sth);

    	ibase_close($dbh);
}
// ----------------------------------------------------------------------
?>
