#! /usr/bin/perl
#
use Cache::Memcached;
#
my $size = 1000;
my $cache = Cache::Memcached->new({
    servers => ['localhost:11211'],
});
#
my $slabs = $cache->stats('slabs');
my @stat_ids = ();
for my $host (keys %{$slabs->{hosts}}) {
    my $slabs_text = $slabs->{hosts}->{$host}->{slabs};
    my @lines = split("\n", $slabs_text);
    for my $line (@lines) {
        ($line =~ /STAT ([0-9]+):chunk_size [0-9]+/) or next;
        push(@stat_ids, $1);
    }
}
#
print "-----------------------\n";
for my $stat_id (@stat_ids) {
    my $cmd = "cachedump $stat_id $size";
    print "[$cmd]\n";
    my $cachedump = $cache->stats($cmd);
    for my $host (keys %{$cachedump->{hosts}}) {
        my $cachedump_text = $cachedump->{hosts}->{$host}->{$cmd};
        my @lines = split("\n", $cachedump_text);
        for my $line (@lines) {
            ($line =~ /^ITEM (.+) \[(.+) b; (.+) s\]/) or next;
            my ($key, $b, $s) = ($1, $2, $3);
            print "\t$key [$b bytes]\n";
        }
    }
}
