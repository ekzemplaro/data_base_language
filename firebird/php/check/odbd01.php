<?php
// DB アカウント定義
define("DBNAME","FB_TEST");      // データソース名
define("DBUSER","BBSUSER");      // 接続ユーザ名
define("DBPASSWORD","xo2z3qwa"); // パスワードの設定

// DB 接続
$dbh = odbc_connect(DBNAME, DBUSER, DBPASSWORD);
if ($dbh == FALSE) {
    echo 'データベースと接続できません。<BR>';
} else {
    echo 'データベースとの接続に成功しました。<BR>';
    // DB 切断
    odbc_close($dbh);
}
?>
