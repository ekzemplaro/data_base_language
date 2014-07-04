#! /usr/bin/perl
#
#	jquery_perl/read/text_perl_read.pl
#
#
#						Apr/28/2011
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
binmode(STDOUT, ":utf8");
my $file_aa= "/var/tmp/plain_text/cities.txt";

my %dict_aa = text_manipulate::text_read_proc  ($file_aa);
#
my $out_str = encode_json (\%dict_aa);
#
print "Content-type: text/json\n\n";
#
print decode ('utf-8',$out_str), "\n";
#
print "\n";
# ----------------------------------------------------------------------
