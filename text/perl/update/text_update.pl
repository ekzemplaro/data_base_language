#! /usr/bin/perl
#
#	update/text_update.pl
#
#					Jul/02/2020
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
binmode STDOUT, ":encoding(UTF-8)";
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
# ----------------------------------------------------------------
#
my $file_text = $ARGV[0];
my $id_in = $ARGV[1];
my $population_in = $ARGV[2];
print	$id_in . "\t";
print	$population_in . "\n";
#
print	"*** 開始 ***\n";
#
my %hash = text_manipulate::text_read_proc ($file_text);

%hash = text_manipulate::dict_update_proc ($id_in,$population_in,%hash);
#
text_manipulate::text_write_proc ($file_text,%hash);
#
print	"*** 終了 ***\n";
#
# ----------------------------------------------------------------------
