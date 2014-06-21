#! /usr/bin/perl
#
#	jquery_perl/read/mysql_perl_read.pl
#
#					May/20/2011
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
use sql_manipulate;
use text_manipulate;
# -----------------------------------------------------------------------
#
my $constr='DBI:mysql:city:host_dbase';
my $user = 'scott';
my $passwd = 'tiger';
#
my $dbi=DBI->connect($constr, $user, $passwd);
sql_manipulate::mysql_utf8_proc ($dbi);
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
