#! /usr/bin/perl
#
#	jquery_perl/read/pdf_perl_read.pl
#
#
#						Jul/27/2012
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
#
use	JSON;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use pdf_manipulate;
#
# ----------------------------------------------------------------------
my $file_pdf= "/var/tmp/pdf/cities.pdf";

my %dict_aa = pdf_manipulate::pdf_to_dict_proc  ($file_pdf);
#
my $out_str = encode_json (\%dict_aa);
#
print "Content-type: text/json\n\n";
#
print decode ('utf-8',$out_str), "\n";
#
print "\n";
# ----------------------------------------------------------------------
