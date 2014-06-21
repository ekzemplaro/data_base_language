#! /usr/bin/perl
#
#	jquery_perl/read/postgre_perl_read.pl
#
#					May/20/2011
#
# -----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use DBI;
use JSON;
#
use lib '/var/www/data_base/common/perl_common';
use sql_manipulate;
use text_manipulate;
# -----------------------------------------------------------------------
#
my $constr= 'DBI:Pg:dbname=city host=localhost';
my $user = 'scott';
my $passwd = 'tiger';

my $dbi=DBI->connect($constr, $user, $passwd);
#
my %dict_aa = sql_manipulate::sql_to_dict_proc ($dbi);
#
$dbi->disconnect;
#
print "Content-Type: text/json\n\n";
#
my $out_str = encode_json (\%dict_aa);
print decode ('utf-8',$out_str), "\n";
#
# -----------------------------------------------------------------------
