#! /usr/bin/perl
#
#	mcachedb_perl_create.pl
#
#					Jun/17/2011
#
# ------------------------------------------------------------
use    strict;
use    warnings;
#
use Cache::Memcached;
#
print "Content-type: text/html\n\n";
#
my $memcached = Cache::Memcached->new({
    servers => ["127.0.0.1:21201"]
});
#
$memcached->set('t1521', '{"name":"新潟","population":25400,"date_mod":"2005-7-24"}');
$memcached->set('t1522', '{"name":"長岡","population":18500,"date_mod":"2005-5-21"}');
$memcached->set('t1523', '{"name":"新発田","population":25600,"date_mod":"2005-7-9"}');
$memcached->set('t1524', '{"name":"上越","population":16700,"date_mod":"2005-7-14"}');
$memcached->set('t1525', '{"name":"糸魚川","population":36400,"date_mod":"2005-9-24"}');
$memcached->set('t1526', '{"name":"加茂","population":31200,"date_mod":"2005-10-7"}');
$memcached->set('t1527', '{"name":"三条","population":38800,"date_mod":"2005-11-4"}');
$memcached->set('t1528', '{"name":"佐渡","population":98700,"date_mod":"2005-8-4"}');
$memcached->set('t1529', '{"name":"柏崎","population":68100,"date_mod":"2005-11-24"}');
$memcached->set('t1530', '{"name":"村上","population":78200,"date_mod":"2005-2-17"}');
$memcached->set('t1531', '{"name":"十日町","population":91800,"date_mod":"2005-6-07"}');
$memcached->set('t1532', '{"name":"五泉","population":48900,"date_mod":"2005-5-7"}');

#
#
#
print "*** OK ***<p />";
#
# ------------------------------------------------------------
