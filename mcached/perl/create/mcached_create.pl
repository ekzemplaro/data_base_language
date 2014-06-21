#! /usr/bin/perl
#
#	mcached_create.pl
#
#					Jun/21/2011
# ---------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;

use	Cache::Memcached;

# ---------------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $memcached = Cache::Memcached->new({
    servers => ["127.0.0.1:11211"]
});


data_set_proc ();

my @keys = ('t1731','t1732','t1733',
	't1734','t1735','t1736',
	't1737','t1738','t1739');
foreach (@keys)
        {
	my $key = $_;
	print $key . "\t" . $memcached->get($key) . "\n";
        }

print	(encode ('utf-8',"*** 終了 ***\n"));
# ---------------------------------------------------------------------
sub data_set_proc
{
$memcached->set('t1731','{"name":"金沢","population":92314,"date_mod":"2005-4-24"}');
$memcached->set('t1732','{"name":"輪島","population":47548,"date_mod":"2005-6-11"}');
$memcached->set('t1733','{"name":"小松","population":53972,"date_mod":"2005-7-2"}');
$memcached->set('t1734','{"name":"七尾","population":15471,"date_mod":"2005-8-14"}');
$memcached->set('t1735','{"name":"珠洲","population":32578,"date_mod":"2005-9-4"}');
$memcached->set('t1736','{"name":"加賀","population":91273,"date_mod":"2005-10-7"}');
$memcached->set('t1737','{"name":"羽咋","population":58376,"date_mod":"2005-11-9"}');
$memcached->set('t1738','{"name":"かほく","population":41528,"date_mod":"2005-12-21"}');
$memcached->set('t1739','{"name":"白山","population":73462,"date_mod":"2005-10-17"}');

}

# ---------------------------------------------------------------------
