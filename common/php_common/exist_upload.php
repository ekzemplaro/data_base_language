<?php
// ------------------------------------------------------------------
//	data_base/common/php_common/exist_upload.php
//
//					Feb/03/2010
//
// ------------------------------------------------------------------
function exist_upload_proc ($str_in,$collection,$name)
{
print	$collection . "\n";
print	$name . "\n";
try
{
  	$url_admin = 'http://127.0.0.1:8086/exist/services/Admin?wsdl';
  	$db = new eXistAdmin('admin', 'hello9', $url_admin);
	$db->connect() or die ($db->getError());

	$url_target = '/db/'. $collection . '/' . $name;
print	$url_target . "\n";
	$db->store($str_in, 'UTF-8', $url_target, true);

	$db->disconnect() or die ($db->getError());
}
catch( Exception $e )
{
	die($e);
}

}

// ------------------------------------------------------------------
