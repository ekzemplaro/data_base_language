#! /usr/bin/perl
#
#	jquery_perl/read/firebird_perl_read.pl
#
#					Jun/19/2012
#
# -----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	DBI;
use	JSON;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use firebird_manipulate;
use text_manipulate;
# -----------------------------------------------------------------------
my $host     = 'localhost';
my $dbpath   = '/var/tmp/firebird/cities.fdb';
my $user     = 'SYSDBA';
my $password = 'tiger';
#
my $data_source = 'dbi:Firebird:' . "host=$host;dbname=$dbpath";
#
my $dbi=DBI->connect($data_source, $user, $password);
#
my %dict_aa = firebird_manipulate::firebird_to_dict_proc ($dbi);
#
$dbi->disconnect;
#
print "Content-Type: text/json\n\n";
#
my $out_str = encode_json (\%dict_aa);
print decode ('utf-8',$out_str), "\n";
#
# -----------------------------------------------------------------------
