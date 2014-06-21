#! /usr/bin/perl
#
#	redis_perl_read.pl
#
#					Jun/17/2011
#
# ----------------------------------------------------------------
use	warnings;
use	strict;
use	utf8;
use	Encode;

use Redis;

use JSON;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use kvalue_manipulate;
# ----------------------------------------------------------------
#
my $rr = Redis->new ( server => 'host_dbase:6379');
#
print "Content-type: text/json\n\n";
#
#
my %dict_aa;
my @keys = ('t1851','t1852','t1853',
	't1854','t1855','t1856',
	't1857','t1858','t1859');
foreach (@keys)
	{
	my $ikey = $_;
	if ($rr->exists($ikey))
	{
	my $str_json = $rr->get($ikey);

#	my $data = decode_json ($str_json);
	my $data = decode_json (encode ('utf-8',$str_json));

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
$rr->quit;
#
print	$out_str;
#
# ----------------------------------------------------------------
