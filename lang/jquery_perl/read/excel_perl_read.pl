#! /usr/bin/perl
#
#	jquery_perl/read/excel_perl_read.pl
#
#
#						Jul/31/2011
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
#
use	JSON;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use excel_manipulate;
#
# ----------------------------------------------------------------------
my $file_excel= "/var/tmp/excel/cities.xls";

my %dict_aa = excel_manipulate::excel_read_proc  ($file_excel);
#
my $out_str = encode_json (\%dict_aa);
#
print "Content-type: text/json\n\n";
#
print decode ('utf-8',$out_str), "\n";
#
print "\n";
# ----------------------------------------------------------------------
