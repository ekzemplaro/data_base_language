#! /usr/bin/perl
#
#	json_delete.pl
#
#					Jun/22/2020
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use Encode;
use JSON;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use file_io;
#
# ----------------------------------------------------------------
print STDERR encode_utf8 ("*** 開始 ***\n");
my $file_json= $ARGV[0];
my $id_in = $ARGV[1];
#
print	$id_in . "\n";
#
my $str_json = file_io::string_read_proc ($file_json);
#
my %dict_aa = %{decode_json ($str_json)};
#
%dict_aa = text_manipulate::dict_delete_proc ($id_in,%dict_aa);
#
my $json_str_new = encode_json (\%dict_aa);
#
#print $json_str_new;
#
file_io::string_write_proc ($file_json,$json_str_new);
#
print STDERR encode_utf8 ("*** 終了 ***\n");
#
# ----------------------------------------------------------------
