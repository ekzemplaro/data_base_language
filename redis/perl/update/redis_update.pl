#!/usr/bin/perl
#
#	redis_update.pl
#
#					Mar/25/2013
#
# ----------------------------------------------------------------
use	warnings;
use	strict;
use	utf8;

use Redis;
use JSON;
use Encode;

use lib '/var/www/data_base/common/perl_common';
use kvalue_manipulate;
use text_manipulate;
use redis_manipulate;

# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $id_in = $ARGV[0];
my $population_in = $ARGV[1];

print ("$id_in\t$population_in\n");

my $rr = Redis->new ( server => 'host_dbase:6379');

redis_manipulate::redis_update_proc ($rr,$id_in,$population_in);
redis_manipulate::redis_display_proc ($rr);
#
$rr->quit;
#
print	(encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------
