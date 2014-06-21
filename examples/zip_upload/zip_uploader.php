<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />
<head><title>zip_uploader</title>
</head>
<body>
<h2>Dec/13/2013 Version</h2>
<hr />
<form method="post" enctype="multipart/form-data" action="uploader.php">
アップロードするファイルを選んで下さい。(*.zip のみ)<p />
<input type="file" name="upfile">
<p />
<input type="submit" value="アップロードする">
</form>
<hr />
ファイル一覧 (ダウンロードするファイルを選んで下さい。)<p />
<blockquote>

<?php
include ('list_file.php');
list_file ();
?>

</blockquote>
<hr />
Dec/13/2013 AM 08:15<p />
</body>
</html>
