#! /usr/bin/perl
#
#	mcached_perl_read.pl
#
#					Jun/17/2011
#
# ----------------------------------------------------------------
use Cache::Memcached;
use JSON;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use kvalue_manipulate;
# ----------------------------------------------------------------
#
my $mem = Cache::Memcached->new({
    servers => ["127.0.0.1:11211"]
});
#
print "Content-type: text/json\n\n";
#
#
my %dict_aa;

my @keys = ('t1731','t1732','t1733',
	't1734','t1735','t1736',
	't1737','t1738','t1739');
foreach (@keys)
	{
	my $ikey = $_;
	$str_json = $mem->get($ikey);

	if ($str_json)
	{
	my $data = decode_json ($str_json);

	my $name=$data->{name};
	my $population=$data->{population};
	my $date_mod=$data->{date_mod};

	%dict_aa = text_manipulate::dict_append_proc
		($ikey,$name,$population,$date_mod,%dict_aa);

	}
}

#
my $out_str = encode_json (\%dict_aa);
#
#
print	$out_str;
#
# ----------------------------------------------------------------
