<?php
if ($_FILES['file']) {
    $size = getimagesize( $_FILES['file']['tmp_name'] );
	$data = array ();
    $data = array( 'width' => $size[0],
                  'height' => $size[1] );
$filename = $_FILES['file']['name'];
$tmp_name = $_FILES['file']['tmp_name'];
	$data['filename'] = $filename;
	$data['tmp_name'] = $tmp_name;

$message = array ();
$message[] = "*** check ***";
$path_target = "/var/tmp/" . $filename;
$message[] = $path_target;

if (move_uploaded_file
		($tmp_name,$path_target) == FALSE)
		{
	        $message[] = 'nothing is uploaded at ' . $_POST['now'];
		$message[] = $filename . " cannot be uploaded.";
		}

	$data['message'] = $message;

    header('Content-type: text/html');
    echo json_encode($data);
}
?>
