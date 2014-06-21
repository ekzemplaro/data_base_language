#! /usr/bin/php
<?php

$memcache = new Memcache;
$memcache->connect('localhost', 11211) or die ("Could not connect");

echo '<html>
<head>
 <title>memcached - cached items</title>
</head>
<body>
<h2>Item Detail</h2>
<form action="" method="get">
  <input type="text" name="cacheKey" value="'.$_GET['cacheKey'].'"/>
  <input type="submit" value="submit" />
</form>';

if( $_GET['cacheKey'] ){
        $key = $_GET['cacheKey'];
        echo "<h3>Key: $key</h3>
        <pre>";
        echo var_dump($memcache->get($key));
        echo "</pre>";
}

echo '<h2>Cached Items</h2>
<form action="" method="get">
  <input type="hidden" name="flush" value="1"/>
  <input type="submit" value="flush!" />
</form>
<pre>';

if( $_GET['flush']){
        $items = $memcache->getStats('items');
        foreach( $items['items'] as $key => $item ){
                $number = $item['number'];
                $dump = $memcache->getStats('cachedump', $key, $number*2);
                foreach( $dump as $ckey => $carr ){
                        $memcache->delete($ckey);
                }
        }
}

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
echo '</pre>
</body>
</html>';
