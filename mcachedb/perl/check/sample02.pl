#! /usr/bin/perl
#
use Cache::Memcached;
#
my $s="localhost:11211";
my $m=new Cache::Memcached({servers=>[$s]});
my $res=$m->stats("items");
$i=$res->{hosts}{$s}{items};
@a=split("\n",$i);
while(<@a>){if($_=~/items:([0-9]+)/){$s{$1}=$_}};
#
foreach $key (keys %s){$cm="cachedump $key 100";
$res=$m->stats($cm);
print "--- ¥n".$cm."¥n";
print $res->{hosts}{$s}{$cm}}
