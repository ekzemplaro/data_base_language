#! /usr/bin/perl
#
#	postgre/perl/read/postgre_read.pl
#
#					Dec/21/2010
#
# -----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use DBI;
use lib '/var/www/data_base/common/perl_common';
use sql_manipulate;
use text_manipulate;
#
# -----------------------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
my $constr = 'DBI:Pg:dbname=city host=localhost';
my $user = 'scott';
my $passwd = 'tiger';

my $dbi = DBI->connect($constr, $user, $passwd);
#sql_manipulate::sql_show_proc ($dbi);
my %dict_aa = sql_manipulate::sql_to_dict_proc ($dbi);
$dbi->disconnect;
#
text_manipulate::dict_display_proc (%dict_aa);
#
print (encode ('utf-8',"*** 終了 ***\n"));
# -----------------------------------------------------------------------
