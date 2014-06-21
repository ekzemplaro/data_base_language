#! /usr/bin/perl
#
#	read/ftp_read.pl
#
#					Jun/16/2011
# -------------------------------------------------------
use	strict;
use	warnings;
use	JSON;
use	utf8;
use	Encode;
use	Data::Dumper;
use Net::FTP;
#
use lib '/var/www/data_base/common/perl_common';
use uri_get;
use text_manipulate;
use ftp_manipulate;
use file_io;
#
# -------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $uri = 'ftp://scott:tiger@host_dbase/city/iwate.json';
#
# my $str_json = uri_get::uri_get_proc ($uri);
my $str_json = ftp_manipulate::ftp_read_proc ('host_dbase','scott','tiger','city/iwate.json');
#print	($str_json);
#
my %dict_aa;
%dict_aa = %{decode_json ($str_json)};
#
print (encode ('utf-8',"*** pppp ***\n"));
#
text_manipulate::dict_display_proc (%dict_aa);
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# -------------------------------------------------------
