#! /usr/bin/perl
#
#	jquery_perl/read/mongo_perl_read.pl
#
#					Jun/25/2012
#
# -----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use DBI;
use JSON;
use Encode;
#
use lib '/var/www/data_base/common/perl_common';
use mongo_manipulate;
use text_manipulate;
# -----------------------------------------------------------------------
#
my $conn = MongoDB::Connection->new( host => 'localhost', port => 27017 );
my $db   = $conn->city_db;
my $col = $db -> saitama;

my %dict_aa = mongo_manipulate::mongo_to_dict_proc ($col);
#
#
print "Content-Type: text/json\n\n";
#
my $out_str = encode_json (\%dict_aa);
print decode ('utf-8',$out_str), "\n";
#
# -----------------------------------------------------------------------
