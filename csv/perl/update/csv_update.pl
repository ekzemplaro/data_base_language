#! /usr/bin/perl
#
#	update/csv_update.pl
#
#					Jan/24/2011
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
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
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my %hash = text_manipulate::csv_read_proc ($file_text);

%hash = text_manipulate::dict_update_proc ($id_in,$population_in,%hash);

text_manipulate::dict_display_proc (%hash);
#
text_manipulate::csv_write_proc ($file_text,%hash);
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------------
