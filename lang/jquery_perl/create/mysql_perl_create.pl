#! /usr/bin/perl
#
#	jquery_perl/create/mysql_perl_create.pl
#
#
#						May/30/2012
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	DBI;
#
use lib '/var/www/data_base/common/perl_common';
use sql_manipulate;
use text_manipulate;
#
# ----------------------------------------------------------------------
my %dict_aa = data_prepare_proc ();
#
my $constr = 'DBI:mysql:city:host_mysql';
my $user = 'scott';
my $passwd = 'tiger';

my $dbi = DBI->connect($constr, $user, $passwd);
#
sql_manipulate::mysql_utf8_proc ($dbi);
sql_manipulate::drop_table_proc ($dbi);
sql_manipulate::create_table_proc ($dbi);
#
sql_manipulate::table_insert_proc ($dbi,%dict_aa);
#
$dbi->disconnect;
#
print "Content-type: text/html\n\n";
#
print "*** OK ***\n";
# ----------------------------------------------------------------------
sub data_prepare_proc
{
		my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t3321','岡山',75200,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3322','倉敷',14200,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3323','津山',58100,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3324','玉野',46400,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3325','笠岡',27100,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3326','井原',98100,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3327','総社',35700,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3328','高梁',83600,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3329','新見',64800,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
