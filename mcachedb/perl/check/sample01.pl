#! /usr/bin/perl
#
use Cache::Memcached;
#
my $s="localhost:11211";
my $mm=new Cache::Memcached({servers=>[$s]});
my $res=$mm->stats("items");
$i=$res->{hosts}{$s}{items};
@a=split("\n",$i);
while(<@a>){if($_=~/items:([0-9]+)/){$s{$1}=$_}};
#
print "*** check dddd ***\n";
#
foreach $key (keys %s)
{
$cm="cachedump $key 100";
print "$key\n";
$res=$mm->stats($cm);
print "--- \n".$cm."\n";
print "*** check ffff ***\n";
#
print $res->{hosts}{$s}{$cm}
}
