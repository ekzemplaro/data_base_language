<?php
session_start();

echo "*** main.php *** start ***<p />";

// ログイン状態のチェック
if (!isset($_SESSION["USERID"])) {
  header("Location: logout.php");
  exit;
}

echo "*** main.php *** cccc ***<p />";
?>

<!DOCTYPE html>
<html lang="ja">
<html>
<head>
<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />
<title>ログイン機能</title>
</head>
<body>
<h2>メインページ</h2>
<!-- ユーザIDにHTMLタグが含まれても良いようにエスケープする -->
<p>ようこそ&nbsp;
<?=htmlspecialchars($_SESSION["USERID"], ENT_QUOTES); ?>
&nbsp;さん</p>
<ul>
<li><a href="logout.php">ログアウト</a></li>
</ul>
<hr />
Aug/22/2016<p /> 
</body>
</html>
