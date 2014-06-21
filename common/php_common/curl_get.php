<?php
// --------------------------------------------------------------
//	cur_get.php
//
//					Feb/21/2010
//
// --------------------------------------------------------------
function curl_get_proc ($url)
{
 
$ch = curl_init();
curl_setopt ($ch, CURLOPT_URL, $url);
curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt ($ch, CURLOPT_PROXY, "");

$data = curl_exec($ch);

curl_close($ch);

return $data;
}
// --------------------------------------------------------------
function curl_put_proc ($url_in,$str_in)
{
$ch = curl_init();
curl_setopt ($ch, CURLOPT_URL, $url_in);

// curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt ($ch, CURLOPT_PROXY, "");

	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');  
	curl_setopt($ch, CURLOPT_POSTFIELDS, $str_in);

$data = curl_exec($ch);

curl_close($ch);

}

// --------------------------------------------------------------
function curl_delete_proc ($url_in)
{
$ch = curl_init();
curl_setopt ($ch, CURLOPT_URL, $url_in);

// curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt ($ch, CURLOPT_PROXY, "");

	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'DELETE');  
#	curl_setopt($ch, CURLOPT_POSTFIELDS, $str_in);

$data = curl_exec($ch);

curl_close($ch);

}

// --------------------------------------------------------------
function curl_upload_proc ($url_in,$str_in)
{
print ("*** curl_upload_proc *** start ***\n");
print ("url_in = " . $url_in . "\n");

$file_tmp="/tmp/tmp00567.txt";

$fp_out=fopen ($file_tmp,"w");
fputs ($fp_out,$str_in);
fclose ($fp_out);

$fp_in=fopen($file_tmp,"r"); 

$ch = curl_init();

curl_setopt($ch, CURLOPT_UPLOAD, 1); 

    curl_setopt($ch, CURLOPT_VERBOSE, 0);

curl_setopt($ch, CURLOPT_INFILE, $fp_in);
  curl_setopt($ch, CURLOPT_INFILESIZE, filesize($file_tmp)); 

curl_setopt ($ch, CURLOPT_URL, $url_in);

curl_setopt ($ch, CURLOPT_PROXY, "");

$response = curl_exec($ch);

print ("response = " . $response . "\n");

curl_close($ch);

fclose ($fp_in);
unlink ($file_tmp);

print ("*** curl_upload_proc *** end ***\n");
}

// --------------------------------------------------------------

?> 
