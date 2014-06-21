#! /usr/bin/perl
#
#	json_read.pl
#
#					Apr/27/2011
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	JSON;
use	Encode;
use	Data::Dumper;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use file_io;
#
# ----------------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
my $file_in= $ARGV[0];
#
my $str_json = file_io::string_read_proc ($file_in);
#
my %dict_aa = %{decode_json ($str_json)};
#
print (encode ('utf-8',"*** pppp ***\n"));
#
text_manipulate::dict_display_proc (%dict_aa);
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
