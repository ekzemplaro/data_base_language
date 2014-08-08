#! /usr/bin/perl
#
#	couch_perl_read.pl
#
#						Feb/25/2012
#
# -------------------------------------------------------------
use	strict;
use	warnings;
use JSON;
#
use LWP::UserAgent;
#
use lib '/var/www/data_base/common/perl_common';
use uri_get;
use text_manipulate;
#
my $url = 'http://localhost:5984/nagano';
#
my $str_json = uri_get::uri_get_proc ($url . "/" . "_all_docs");
#
my %hash_aa = %{decode_json ($str_json)};
my %dict_aa;
#
for (my $it = 0; $it < $hash_aa{"total_rows"}; $it++)
	{
	my $key = $hash_aa{"rows"}[$it]{"key"};
	my $str_json = uri_get::uri_get_proc ($url . "/" . $key);
	my $data = decode_json ($str_json);

	my $name=$data->{name};
	my $population=$data->{population};
	my $date_mod=$data->{date_mod};

	%dict_aa = text_manipulate::dict_append_proc
		($key,$name,$population,$date_mod,%dict_aa);

	}

print "Content-type: text/json\n\n";
#
my $out_str = encode_json (\%dict_aa);
#
print $out_str;
#
# -------------------------------------------------------------
