#! /usr/bin/perl
#
#	mcachedb_create.pl
#
#						Sep/14/2015
#
# ------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use Cache::Memcached;
# ------------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));

my $memcached = Cache::Memcached->new({
    servers => ["host_ubuntu:21201"]
});

data_set_proc ();

my @keys = ('t1521','t1522','t1523',
	't1524','t1525','t1526',
	't1527','t1528','t1529',
	't1530','t1531','t1532');
foreach (@keys)
{
	my $ikey = $_;
	print $ikey . "\t" . $memcached->get($ikey) . "\n";
}


print	(encode ('utf-8',"*** 終了 ***\n"));
# ------------------------------------------------------------------
sub data_set_proc 
{
$memcached->set('t1521', '{"name":"新潟","population":72641,"date_mod":"2005-4-14"}');
$memcached->set('t1522', '{"name":"長岡","population":43657,"date_mod":"2005-6-21"}');
$memcached->set('t1523', '{"name":"新発田","population":52618,"date_mod":"2005-7-02"}');
$memcached->set('t1524', '{"name":"上越","population":19674,"date_mod":"2005-8-14"}');
$memcached->set('t1525', '{"name":"糸魚川","population":32649,"date_mod":"2005-9-04"}');
$memcached->set('t1526', '{"name":"加茂","population":38672,"date_mod":"2005-10-07"}');
$memcached->set('t1527', '{"name":"三条","population":92578,"date_mod":"2005-11-04"}');
$memcached->set('t1528', '{"name":"佐渡","population":54716,"date_mod":"2005-10-04"}');
$memcached->set('t1529', '{"name":"柏崎","population":65123,"date_mod":"2005-12-04"}');
$memcached->set('t1530', '{"name":"村上","population":36297,"date_mod":"2005-02-07"}');
$memcached->set('t1531', '{"name":"十日町","population":14658,"date_mod":"2005-06-07"}');
$memcached->set('t1532', '{"name":"五泉","population":48941,"date_mod":"2005-05-07"}');
}

# ------------------------------------------------------------------
