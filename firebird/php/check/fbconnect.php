<?php
// DB アカウント定義
define("DBNAME","/var/tmp/firebird/aaa.fdb"); // データベース名
define("DBUSER","SYSDBA");         // 接続ユーザ名
define("DBPASS","hello9");      // パスワード

// DB 接続
$dbh = ibase_connect(DBNAME,DBUSER,DBPASS,"UTF8");
if ($dbh == FALSE) {
    echo 'データベースと接続できません。<BR>';
} else {
    echo 'データベースとの接続に成功しました。<BR>';
    // DB 切断
    ibase_close($dbh);
}
?>
