#! /usr/bin/perl
#
#	tyrant_perl_read.pl
#
#					Jul/11/2011
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
    servers => ["127.0.0.1:1978"]
});
#
print "Content-type: text/json\n\n";
#
#
my %dict_aa;

my @keys = ('t4761','t4762','t4763',
	't4764','t4765','t4766',
	't4767','t4768','t4769');
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
