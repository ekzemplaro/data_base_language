#! /usr/bin/perl
#
#	exist_read.pl
#
#					May/20/2011
# ------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use xml_manipulate;
use uri_get;
#
# ------------------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
#
my $uri = 'http://localhost:8086/exist/rest/db/cities/cities.xml';
#
#
my $str_xml = uri_get::uri_get_proc ($uri);
#
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
text_manipulate::dict_display_proc (%dict_aa);
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# ------------------------------------------------------------------
