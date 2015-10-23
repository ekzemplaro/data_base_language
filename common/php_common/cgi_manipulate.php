<?php
// ------------------------------------------------------------------
//	cgi_manipulate.php
//
//				May/06/2010
// ------------------------------------------------------------------
function cgi_manipulate ()
{
$arry_param = array ();

if (isset ($_REQUEST['my_data']))
	{
	$out_str = "";
	$count = 0;
	$tmp = $_REQUEST['my_data'];
	$data_modified = str_replace ('\"', '"',$tmp);

	foreach ($data_modified as $key_aa => $val_aa)
		{
		echo $val_aa['id'] . " --- ";
		echo $val_aa['population'] . " ";
		array_push ($arry_param,$val_aa);
		}
	}
else
	{
	echo "*** NG *** cgi_manipulate *** May/06/2011 ***<br />";
	}


	return $arry_param;
}

// ------------------------------------------------------------------
?>
