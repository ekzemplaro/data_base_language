<?php
require 'password.php';
// セッション開始
session_start();

$db['host'] = "localhost";  // DBサーバのurl
$db['user'] = "scott";
$db['pass'] = "tiger";
$db['dbname'] = "password";

echo "*** login.php *** start ***<p />";

// エラーメッセージの初期化
$errorMessage = "";

echo "*** login.php *** bbbb ***<p />";
// ログインボタンが押された場合
if (isset($_POST["login"])) {
echo "*** login.php *** cccc ***<p />";
  // １．ユーザIDの入力チェック
echo "*** login.php *** pushed ***<p />";
  if (empty($_POST["userid"])) {
    $errorMessage = "ユーザIDが未入力です。";
  } else if (empty($_POST["password"])) {
    $errorMessage = "パスワードが未入力です。";
  } 

echo "*** login.php *** dddd ***<p />";
  // ２．ユーザIDとパスワードが入力されていたら認証する
  if (!empty($_POST["userid"]) && !empty($_POST["password"])) {
    // mysqlへの接続
    $mysqli = new mysqli($db['host'], $db['user'], $db['pass']);
    if ($mysqli->connect_errno) {
      print('<p>データベースへの接続に失敗しました。</p>' . $mysqli->connect_error);
      exit();
    }

echo "*** login.php *** ffff ***<p />";
    // データベースの選択
    $mysqli->select_db($db['dbname']);

    // 入力値のサニタイズ
    $userid = $mysqli->real_escape_string($_POST["userid"]);

    // クエリの実行
    $query = "SELECT * FROM db_user WHERE name = '" . $userid . "'";
    $result = $mysqli->query($query);
    if (!$result) {
      print('クエリーが失敗しました。' . $mysqli->error);
      $mysqli->close();
      exit();
    }

echo "*** login.php *** hhhh ***<p />";

    while ($row = $result->fetch_assoc()) {
      // パスワード(暗号化済み）の取り出し
      $db_hashed_pwd = $row['password'];
    }

    // データベースの切断
    $mysqli->close();

    // ３．画面から入力されたパスワードとデータベースから取得したパスワードのハッシュを比較します。
if (password_verify($_POST["password"], $db_hashed_pwd)) {
      // ４．認証成功なら、セッションIDを新規に発行する
      session_regenerate_id(true);
      $_SESSION["USERID"] = $_POST["userid"];
      header("Location: main.php");
      exit;
    } 
    else {
      // 認証失敗
      $errorMessage = "ユーザIDあるいはパスワードに誤りがあります。";
    } 
  } else {
    // 未入力なら何もしない
  } 
} 
 
?>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />
<title>ログイン機能</title>
</head>
<body>
<h2>ログイン機能　サンプルアプリケーション</h2>
  <!-- $_SERVER['PHP_SELF']はXSSの危険性があるので、actionは空にしておく -->
  <!--<form id="loginForm" name="loginForm" action="<?php print($_SERVER['PHP_SELF']) ?>" method="POST">-->
<form id="loginForm" name="loginForm" action="" method="POST">
  <fieldset>
  <legend>ログインフォーム</legend>
  <div><?php echo $errorMessage ?></div>
  <label for="userid">ユーザID&nbsp;</label><input type="text" id="userid" name="userid" value="<?php echo htmlspecialchars($_POST["userid"], ENT_QUOTES); ?>">
<p />
  <label for="password">パスワード&nbsp;</label><input type="password" id="password" name="password" value="">
<p />
  <input type="submit" id="login" name="login" value="ログイン">
  </fieldset>
</form>
<hr />
Aug/22/2016<p />
</body>
</html>
