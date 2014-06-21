#!/usr/bin/perl
#
#	redis_read.pl
#
#					Mar/25/2013
#
# ----------------------------------------------------------------
use	warnings;
use	strict;
use	utf8;
use	Encode;

use	Redis;

use lib '/var/www/data_base/common/perl_common';
use kvalue_manipulate;
use redis_manipulate;

# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $rr = Redis->new ( server => 'host_dbase:6379');
#
redis_manipulate::redis_display_proc ($rr);
#
$rr->quit;
#
print	(encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------
