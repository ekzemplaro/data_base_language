<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />
<head><title>uploader.php</title></head>
<body>
<p> file uploader </p>
<?php
// --------------------------------------------------------------------
function upload_exec_proc ($updir,$filename)
{
	if (move_uploaded_file($_FILES['upfile']['tmp_name'],
		$updir.$filename) == FALSE)
	{
	print("*** Upload failed ***<br />");
	print($_FILES['upfile']['error'] + '<br />');

	print($_SERVER['MAX_FILE_UPLOADS'] . '<br />');
	print($_SERVER['UPLOAD_MAX_FILESIZE'] . '<br />');
	print($_SERVER['REMOTE_ADDR'] . '<br />');

	print ($filename . '<br />');

	print("*** Upload failed ***<br />");
	}
	else
		{
		print("<b /> $filename </b> uploaded<p />");
		echo "アップロードは成功しました。<p />"; 
		}
}

// --------------------------------------------------------------------
$updir = "./work_area/";
$filename = $_FILES['upfile']['name'];


$llx = strlen ($filename);
$suffix4 = substr ($filename,$llx-4);
echo "strlen = " . $llx . "<p />";
echo "suffix = " . $suffix4 . "<p />";

if (strcmp ($suffix4,".zip") === 0)
	{
	upload_exec_proc ($updir,$filename);
	}
else
	{
	echo "<h2>*** error ***</h2><p />";
	echo "<blockquote>";
	echo "filename = " . $filename . "<p />";
	echo "suffix = " . $suffix4 . "<p />";
	echo "only *.zip can be uploaded. <p />";
	echo "このファイルはアップロードできません。<p />";
	echo "*.zip ファイルだけがアップロード可能です。<p />";
	echo "</blockquote>";
	print("*** Upload failed ***<p />");
	}

// --------------------------------------------------------------------
?>
<hr />
<a href="./">Return</a><p />
<hr />
Dec/13/2013<p />
</body>
</html>
