#! /usr/bin/perl
#
#	redis_perl_create.pl
#
#					Apr/13/2012
#
# ------------------------------------------------------------
use    strict;
use    warnings;
use	utf8;
#
use Redis;
# ------------------------------------------------------------
#
print "Content-type: text/html\n\n";
#
my $rr = Redis->new ( server => 'host_dbase:6379');
#
$rr->set ('t1851' => '{"name":"福井","population":34600,"date_mod":"2005-2-4"}');
$rr->set ('t1852' => '{"name":"敦賀","population":72500,"date_mod":"2005-5-19"}');
$rr->set ('t1853' => '{"name":"小浜","population":41900,"date_mod":"2005-8-11"}');
$rr->set ('t1854' => '{"name":"大野","population":75400,"date_mod":"2005-8-19"}');
$rr->set ('t1855' => '{"name":"勝山","population":38700,"date_mod":"2005-2-23"}');
$rr->set ('t1856' => '{"name":"鯖江","population":71600,"date_mod":"2005-8-24"}');
$rr->set ('t1857' => '{"name":"あわら","population":39200,"date_mod":"2005-3-15"}');
$rr->set ('t1858' => '{"name":"越前","population":65300,"date_mod":"2005-5-12"}');
$rr->set ('t1859' => '{"name":"坂井","population":67900,"date_mod":"2005-8-9"}');
#
#
$rr->quit;
#
print "*** OK ***<p />";
#
# ------------------------------------------------------------
