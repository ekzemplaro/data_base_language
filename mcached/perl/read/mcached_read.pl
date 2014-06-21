#! /usr/bin/perl
#
#	mcached_read.pl
#
#					Jun/17/2011
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;

use	Encode;
use Cache::Memcached;
use JSON;
use Data::Dumper;
#
#use Encode::Guess qw/ shiftjis euc-jp 7bit-jis /;
#use Encode qw/ decode /;
#
use lib '/var/www/data_base/common/perl_common';
#
use mcache_manipulate;
use kvalue_manipulate;
# ----------------------------------------------------------------
#
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $mem = Cache::Memcached->new({
    servers => ["127.0.0.1:11211"]
});
#
my @keys = ('t1731','t1732','t1733',
	't1734','t1735','t1736',
	't1737','t1738','t1739');
foreach (@keys)
	{
	my $ikey = $_;
	mcache_manipulate::mcache_display_proc ($mem,$ikey);
	}
#
print	(encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------
