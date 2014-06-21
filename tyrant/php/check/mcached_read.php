#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	mcached_read.php
//
//					May/13/2010
//
// ------------------------------------------------------------------
$mem = memcache_connect('localhost', 11211);
$mem->addServer('localhost', 11211);

print "*** start ***\n";
		
$items = $mem->getStats('items');
foreach( $items['items'] as $key => $item )
	{
//	var_dump ($item);
	$number = $item['number'];
	$dump = $mem->getStats('cachedump', $key, $number*2);
	foreach( $dump as $ckey => $carr )
		{
		$json_str=$mem->get($ckey);
		$root=json_decode ($json_str);
		print $ckey . "\t";
		print $root->name . "\t";
		print $root->population . "\t";
		print $root->date_mod . "\n";
		}
	}

print "*** end ***\n";
?>
