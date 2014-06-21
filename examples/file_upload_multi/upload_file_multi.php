<?php
// ------------------------------------------------------------------
//	upload_file_multi.php
//
//						Aug/28/2012
//
// ------------------------------------------------------------------
// $from = $_POST['from'];
// $to = $_POST['to'];
// $division = $_POST['division'];

$message = array ();
$message[] = "*** upload_file_multi.php *** start *** ";
$message[] = "param_aa = " . $_POST['param_aa'];
$message[] = "param_bb = " . $_POST['param_bb'];

for ($it = 0; $it < count($_FILES['name_upload']['tmp_name']); $it++)
	{
	$filename = $_FILES['name_upload']['name'][$it];

	$tmp_name = $_FILES['name_upload']['tmp_name'][$it];
	$message = upload_proc_exec ($filename,$tmp_name,$message);
	}

$message[] = "*** upload_file_multi.php *** end *** ";
$result = array ();
$result['message'] = $message;
$str_json = json_encode ($result);

print	$str_json;

// ------------------------------------------------------------------
function upload_proc_exec ($filename,$tmp_name,$message)
{
	$message[] = "upload_proc_exec *** start *** " . $filename;

	$folder = "data_work";

	$llx = strlen ($filename);
	$suffix4 = substr ($filename,$llx-4);

	if ($llx == 0)
		{
		$message[] = '*** error ***';
		$message[] = "Please select a file.";
		$message[] = "*** Upload failed ***";
		}
	else if ((strcmp ($suffix4,".zip") === 0)
		|| (strcmp ($suffix4,".bz2") === 0))
		{
		$message = upload_exec_proc_s2 ($folder,$filename,$tmp_name,$message);
		}
	else
		{
		$message[] = '*** error ***';
		$message[] = "filename = " . $filename;
		$message[] = "*** Upload failed ***";
		}

	return	$message;
}

// ------------------------------------------------------------------
function upload_exec_proc_s2 ($folder,$filename,$tmp_name,$message)
{

	$updir = $folder . "/";
	$path_target = $updir . $filename;

	if (move_uploaded_file
		($tmp_name,$path_target) == FALSE)
		{
		$message[] = $path_target;
	        $message[] = 'Aug/27/2012 nothing is uploaded at ' . $_POST['now'];
		$message[] = $filename . " cannot be uploaded.";

		$message[] = '$folder is ' . $folder;
		$message[] = '$filename is ' . $filename;
		$message[] = '$updir is ' . $updir;
		$message[] = '$path_target is ' . $path_target;
		}
	else
		{
		$message[] = 'Folder : ' . $folder;
		$today = date ("Y-m-d G:i");
		$message[] =  $filename  . ' is uploaded at ' . $today;

		$message[] = $filename;
		}

	return	$message;
}

// ------------------------------------------------------------------
?>
