#!/usr/bin/perl
#
#	jquery_perl/read/sqlite3_perl_read.pl
#
#				Jun/23/2010
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;

use DBI;
use	JSON;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use sqlite3_manipulate;
#
# ----------------------------------------------------------------------
print "Content-Type: text/json\n\n";
my $db_in_aa = "/var/tmp/sqlite3/cities.db";
#
my %dict_aa = sqlite3_manipulate::sqlite3_to_dict_proc ($db_in_aa);

my $out_str = encode_json (\%dict_aa);
print decode ('utf-8', $out_str), "\n";
#
# ----------------------------------------------------------------------
