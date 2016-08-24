<?php
session_start();

echo "*** logout.php *** start ***<p />";

if (isset($_SESSION["USERID"])) {
  $errorMessage = "ログアウトしました。";
}
else {
  $errorMessage = "セッションがタイムアウトしました。";
}
// セッション変数のクリア
$_SESSION = array();

// セッションクリア
@session_destroy();

echo "*** logout.php *** pppp ***<p />";
?>

<!DOCTYPE html>
<html lang="ja">
<html>
<head>
<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />
<title>ログイン機能</title>
</head>
  <body>
  <h2>ログイン機能　サンプルアプリケーション</h2>
  <div><?php echo $errorMessage; ?></div>
  <ul>
  <li><a href="login.php">ログイン画面に戻る</a></li>
  </ul>
<hr />
Aug/22/2016<p />
</body>
</html>
