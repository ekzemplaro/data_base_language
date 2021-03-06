#! /usr/bin/perl
#
#	berkeley_perl_read.pl
#
#					May/20/2011
#
# --------------------------------------------------------------
use	strict;
use	warnings;

use JSON;
use DB_File;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use kvalue_manipulate;
# --------------------------------------------------------------
#
my $db_file="/var/tmp/berkeley/cities.db";
#
print "Content-type: text/json\n\n";
#
dbmopen (my %dd,$db_file,0644) || die "cannot open DBM";
#
#
my %dict_aa;
foreach my $key (keys %dd)
{
	my $str_json = $dd{$key};
	my $data = decode_json ($str_json);
	my $name=$data->{name};
	my $population=$data->{population};
	my $date_mod=$data->{date_mod};

	%dict_aa = text_manipulate::dict_append_proc
		($key,$name,$population,$date_mod,%dict_aa);

}
#
dbmclose (%dd);
#
my $out_str = encode_json (\%dict_aa);
#
#
print	$out_str;
#

