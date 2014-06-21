#! /usr/bin/perl
#
#	perl/read/xml_read.pl
#
#				May/20/2011
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use xml_manipulate;
use file_io;
#
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $file_xml = $ARGV[0];
my $str_xml = file_io::string_read_proc ($file_xml);
#
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
text_manipulate::dict_display_proc (%dict_aa);
#
print	(encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------
