#! /usr/bin/perl
#
#	tyrant_perl_create.pl
#
#					Jun/28/2013
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
    servers => ["127.0.0.1:1978"]
});
#
$memcached->set('t4761','{"name":"那覇","population":73200,"date_mod":"2005-9-8"}');
$memcached->set('t4762','{"name":"宜野湾","population":41500,"date_mod":"2005-4-11"}');
$memcached->set('t4763','{"name":"石垣","population":67200,"date_mod":"2005-3-2"}');
$memcached->set('t4764','{"name":"浦添","population":15600,"date_mod":"2005-8-14"}');
$memcached->set('t4765','{"name":"名護","population":37200,"date_mod":"2005-9-4"}');
$memcached->set('t4766','{"name":"糸満","population":31600,"date_mod":"2005-5-17"}');
$memcached->set('t4767','{"name":"沖縄","population":58400,"date_mod":"2005-1-9"}');
$memcached->set('t4768','{"name":"豊見城","population":47500,"date_mod":"2005-10-21"}');
$memcached->set('t4769','{"name":"うるま","population":73700,"date_mod":"2005-11-27"}');
#
#
#
print "*** OK ***<p />";
#
# ------------------------------------------------------------
