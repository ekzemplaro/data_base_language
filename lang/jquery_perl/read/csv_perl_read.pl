#! /usr/bin/perl
#
#	jquery_perl/read/csv_perl_read.pl
#
#
#						May/19/2011
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
#
use	JSON;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
#
# ----------------------------------------------------------------------
my $file_aa= "/var/tmp/csv/cities.csv";

my %dict_aa = text_manipulate::csv_read_proc  ($file_aa);
#
my $out_str = encode_json (\%dict_aa);
#
print "Content-type: text/json\n\n";
#
print decode ('utf-8',$out_str), "\n";
#
print "\n";
# ----------------------------------------------------------------------
