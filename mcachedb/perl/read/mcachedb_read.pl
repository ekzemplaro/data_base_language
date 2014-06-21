#! /usr/bin/perl
#
#	mcachedb_read.pl
#
#					Jun/16/2011
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use Cache::Memcached;
use JSON;
use Data::Dumper;
#
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use mcache_manipulate;
use kvalue_manipulate;
# ----------------------------------------------------------------
#
print "*** 開始 ***\n";
#
my $mem = Cache::Memcached->new({
    servers => ["localhost:21201"]
});
#
my @keys = ('t1521','t1522','t1523',
	't1524','t1525','t1526',
	't1527','t1528','t1529',
	't1530','t1531','t1532');
#
foreach (@keys)
{
	my $ikey = $_;
	mcache_manipulate::mcache_display_proc ($mem,$ikey);
	}
#
print "*** 終了 ***\n";
# ----------------------------------------------------------------
