#! /usr/bin/perl
#
#	tyrant_read.pl
#
#					Sep/14/2015
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
    servers => ["host_ubuntu:1978"]
});
#
my @keys = ('t4761','t4762','t4763',
	't4764','t4765','t4766',
	't4767','t4768','t4769');

foreach (@keys)
	{
	my $ikey = $_;
	mcache_manipulate::mcache_display_proc ($mem,$ikey);
	}
#
print	(encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------
