#! /usr/bin/perl
#
#	jquery_perl/create/postgre_perl_create.pl
#
#
#						May/30/2012
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
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
my $constr = 'DBI:Pg:dbname=city host=localhost';
my $user = 'scott';
my $passwd = 'tiger';
my $dbi = DBI->connect($constr, $user, $passwd);
#
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
		('t3461','広島',52900,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3462','福山',87200,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3463','東広島',69300,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3464','呉',46700,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3465','尾道',17900,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3466','竹原',98100,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3467','三次',35400,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3468','大竹',85100,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3469','府中',67800,'2005-8-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
