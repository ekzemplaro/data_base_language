<?php
// ------------------------------------------------------------------
//	mcached_manipulate.php
//
//					Jul/16/2010
//
// ------------------------------------------------------------------
function mcached_display_proc ($mem)
{
$items = $mem->getStats('items');
foreach( $items['items'] as $key => $item )
	{
//	var_dump ($item);
	$number = $item['number'];
	$dump = $mem->getStats('cachedump', $key, $number*2);
	foreach( $dump as $ckey => $carr )
		{
		kvalue_display_proc ($mem,$ckey);
		}
	}
}

// ------------------------------------------------------------------
?>
