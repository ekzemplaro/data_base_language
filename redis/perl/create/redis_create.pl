#!/usr/bin/perl
#
#	redis_create.pl
#
#					Mar/25/2013
#
# ----------------------------------------------------------------
use	warnings;
use	strict;
use	utf8;

use Redis;
use Encode;

# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
#my $rr = Redis->new;
my $rr = Redis->new ( server => 'host_dbase:6379');

$rr->set ('t1851' => '{"name":"福井","population":38918,"date_mod":"2005-9-24"}');
$rr->set ('t1852' => '{"name":"敦賀","population":71625,"date_mod":"2005-2-19"}');
$rr->set ('t1853' => '{"name":"小浜","population":45739,"date_mod":"2005-4-11"}');
$rr->set ('t1854' => '{"name":"大野","population":71864,"date_mod":"2005-7-19"}');
$rr->set ('t1855' => '{"name":"勝山","population":32518,"date_mod":"2005-10-23"}');
$rr->set ('t1856' => '{"name":"鯖江","population":73654,"date_mod":"2005-8-24"}');
$rr->set ('t1857' => '{"name":"あわら","population":35146,"date_mod":"2005-3-15"}');
$rr->set ('t1858' => '{"name":"越前","population":91653,"date_mod":"2005-5-12"}');
$rr->set ('t1859' => '{"name":"坂井","population":82679,"date_mod":"2005-7-27"}');


#redis_manipulate::redis_display_proc ($rr);
#
$rr->quit;
#
print	(encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------
