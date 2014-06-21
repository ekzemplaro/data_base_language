<?php
// ------------------------------------------------------------------
//	file_upload.php
//
//						Jun/10/2014
//
// ------------------------------------------------------------------
$message = array ();

$now = $_POST['now'];
$message[] =  "file_upload.php *** start *** Jun/10/2014";

$folder = 'data_work';

$message[] =  "folder = " . $folder;
$message[] = "now = " . $now;

$tmp_name_xx = $_FILES["upload_file"]["tmp_name"];
$filename = $_FILES['upload_file']['name'];
$message[] = "aaa tmp_name_xx = " . $tmp_name_xx;
$message[] = "aaa filename = " . $filename;

$message = upload_proc ($folder,$filename,$tmp_name_xx,$message);

$message[] = "*** upload_file.php *** end *** ";
$result = array ();
$result['folder'] = $folder;
$result['filename'] = $filename;
$result['message'] = $message;
$str_json = json_encode ($result);

print	$str_json;
// ------------------------------------------------------------------
function upload_proc ($folder,$filename,$tmp_name_xx,$message)
{
	$message[] = "upload_proc folder = " . $folder;
	$message[] = "upload_proc filename = " . $filename;

	$llx = strlen ($filename);

	if ($llx == 0)
		{
		$message[] = '<h2><span id="red">*** error p ***</span></h2>';
		$message[] = "<blockquote>";
		$message[] = "Please select a file.";
		$message[] = "</blockquote>";
		$message[] = "*** Upload failed ***";
		}
	else
		{
		$message[] = "*** upload_proc *** ppp  ***";
		$message = upload_exec_proc ($folder,$filename,$tmp_name_xx,$message);
		}


	return	$message;
}

// ------------------------------------------------------------------
function upload_exec_proc ($folder,$filename,$tmp_name_xx,$message)
{
	$message[] = "upload_proc_exec *** start *** " . $filename;

	$path_target = $folder . '/' . $filename;

	$message[] = "*** upload_exec_proc *** " . $folder . " ***";
	$message[] = "*** upload_exec_proc *** " . $path_target . " ***";

	if (move_uploaded_file
		($tmp_name_xx,$path_target) == FALSE)
		{
	        $message[] = 'nothing is uploaded at ' . $_POST['now'];
		$message[] = $filename . " cannot be uploaded.";
		}
	else
		{
		$message[] = 'Uploaded at' . $_POST['now'];
		$message[] = 'Folder : ' . $folder;
		$message[] = $filename  . " is uploaded";

		$message = info_display_proc ($path_target,$message);
		}

	return	$message;
}

// ------------------------------------------------------------------
// [8-4]:
function info_display_proc ($path_target,$message)
{
	$message[] = "path_target = " . $path_target;
	$message[] = "REMOTE_ADDR = " . $_SERVER["REMOTE_ADDR"];
	$message[] = "SERVER_NAME = " . $_SERVER["SERVER_NAME"];
	$message[] = "SERVER_ADDR = " . $_SERVER["SERVER_ADDR"];
	$message[] = "HTTP_USER_AGENT = " . $_SERVER["HTTP_USER_AGENT"];

	$url =  "http://" . $_SERVER["SERVER_ADDR"];
	$url .= "/data_base/examples/file_upload/" .  $path_target;

//	$message[] = "<blockquote>";
//	$message[] = '<span id="green">' . $url . '</span>';
//	$message[] = "</blockquote>";

	return	$message;
}

// ------------------------------------------------------------------
?>
