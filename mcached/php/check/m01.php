#! /usr/bin/php
<?php

$memcache = new Memcache;
$memcache->connect('localhost', 11211) or die ("Could not connect");



$items = $memcache->getStats('items');

$count = 0;
$ktotal = 0;
$vtotal = 0;

foreach( $items['items'] as $key => $item ){
        $number = $item['number'];
        $dump = $memcache->getStats('cachedump', $key, $number*2);
        foreach( $dump as $ckey => $carr ){
                echo $key,':', $ckey, ': [', $carr[0], 'b; ', $carr[1], 's]', "\n";
                $count++;
                $vtotal += $carr[0];
                $ktotal += strlen($ckey);
        }
}

$total = $vtotal + $ktotal;
echo "--\nkey total:$ktotal b\nvalue total:$vtotal b\ntotal: $total b\ncount:$count\n";
