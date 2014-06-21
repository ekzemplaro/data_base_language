#! /usr/bin/perl
#
#	mcachedb_perl_read.pl
#
#					Jun/17/2011
#
# ------------------------------------------------------------
use	strict;
use	warnings;
#
use Cache::Memcached;
use JSON;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use kvalue_manipulate;
# ------------------------------------------------------------
#
my $mem = Cache::Memcached->new({
    servers => ["127.0.0.1:21201"]
});
#
print "Content-type: text/json\n\n";
#
#
my %dict_aa;
my @keys = ('t1521','t1522','t1523',
	't1524','t1525','t1526',
	't1527','t1528','t1529',
	't1530','t1531','t1532');
#
foreach (@keys)
{
	my $ikey = $_;

	my $str_json = $mem->get($ikey);

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
# ------------------------------------------------------------
