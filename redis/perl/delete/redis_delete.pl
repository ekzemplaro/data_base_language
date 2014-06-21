#!/usr/bin/perl
#
#	redis_delete.pl
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
my $key_in = $ARGV[0];

print ("$key_in\n");

my $rr = Redis->new ( server => 'host_dbase:6379');

if ($rr->exists($key_in))
	{
	$rr->del($key_in);
	}

redis_manipulate::redis_display_proc ($rr);
#
$rr->quit;
#
print	(encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------
