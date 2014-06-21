#! /usr/bin/perl
#
#	webdav_read.pl
#
#					Jan/24/2012
# -------------------------------------------------------
use	strict;
use	JSON;
use	warnings;
use	utf8;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use uri_get;
use text_manipulate;
#
# -------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $uri = 'http://host_dbase:3004/city/tokyo.json';
#
my $str_json = uri_get::uri_get_proc ($uri);
#
#print ($str_json);
#
my %dict_aa = %{decode_json ($str_json)};
#
print (encode ('utf-8',"*** pppp ***\n"));
#
text_manipulate::dict_display_proc (%dict_aa);
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# -------------------------------------------------------
