#! /usr/bin/perl
#
#	mcached_perl_create.pl
#
#					Jul/03/2012
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
    servers => ["127.0.0.1:11211"]
});
#
$memcached->set('t1731','{"name":"金沢","population":73200,"date_mod":"2005-2-8"}');
$memcached->set('t1732','{"name":"輪島","population":41500,"date_mod":"2005-7-11"}');
$memcached->set('t1733','{"name":"小松","population":67200,"date_mod":"2005-3-2"}');
$memcached->set('t1734','{"name":"七尾","population":15600,"date_mod":"2005-8-14"}');
$memcached->set('t1735','{"name":"珠洲","population":37800,"date_mod":"2005-9-4"}');
$memcached->set('t1736','{"name":"加賀","population":39600,"date_mod":"2005-5-17"}');
$memcached->set('t1737','{"name":"羽咋","population":52800,"date_mod":"2005-1-9"}');
$memcached->set('t1738','{"name":"かほく","population":47500,"date_mod":"2005-10-21"}');
$memcached->set('t1739','{"name":"白山","population":73100,"date_mod":"2005-11-27"}');
#
#
#
print "*** OK ***<p />";
#
# ------------------------------------------------------------
