#! /usr/bin/perl
#
#	jquery_perl/read/xml_perl_read.pl
#
#				May/20/2011
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
#
use CGI;
use XML::DOM;
use JSON;
use Encode;
#
use lib '/var/www/data_base/common/perl_common';
use file_io;
use xml_manipulate;
#
my $file_xml = "/var/tmp/xml_file/cities.xml";
#
my $str_xml = file_io::string_read_proc ($file_xml);
#
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
my $out_str = encode_json (\%dict_aa);
#
print "Content-type: text/json\n\n";
#
print decode ('utf-8',$out_str), "\n";
#
# ----------------------------------------------------------------
