#! /usr/bin/perl
#
#	json_update.pl
#
#					Jul/02/2020
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use JSON;
binmode STDOUT, ":encoding(UTF-8)";
binmode STDERR, ":encoding(UTF-8)";
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use file_io;
#
# ----------------------------------------------------------------
print STDERR "*** 開始 ***\n";
my $file_json= $ARGV[0];
my $id_in = $ARGV[1];
my $population_in = $ARGV[2];
#
print	$id_in . "\t";
print	$population_in . "\n";
#
my $str_json = file_io::string_read_proc ($file_json);
#
#$str_json = decode ('utf-8',$str_json);
#
my %dict_aa = %{decode_json ($str_json)};
#
text_manipulate::dict_update_proc ($id_in,$population_in,%dict_aa);
#
my $json_str_new = encode_json (\%dict_aa);
#
#
file_io::string_write_proc ($file_json,$json_str_new);
#
print STDERR "*** 終了 ***\n";
#
# ----------------------------------------------------------------
