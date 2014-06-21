#! /usr/bin/perl
#
#	jquery_perl/create/firebird_perl_create.pl
#
#
#						Jun/19/2012
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	DBI;
#
use lib '/var/www/data_base/common/perl_common';
use firebird_manipulate;
use text_manipulate;
#
# ----------------------------------------------------------------------
my %dict_aa = data_prepare_proc ();
#
my $host     = 'localhost';
my $dbpath   = '/var/tmp/firebird/cities.fdb';
my $user     = 'SYSDBA';
my $password = 'tiger';
#
my $data_source = 'dbi:Firebird:' . "host=$host;dbname=$dbpath";
#
my $dbi = DBI->connect($data_source, $user, $password);
#
firebird_manipulate::firebird_drop_proc ($dbi);
firebird_manipulate::firebird_create_proc ($dbi);
#
firebird_manipulate::firebird_table_insert_proc ($dbi,%dict_aa);
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
		('t3821','松山',52800,'2005-6-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3822','今治',14900,'2005-4-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3823','宇和島',58100,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3824','八幡浜',46400,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3825','新居浜',27600,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3826','西条',98100,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3827','大洲',35700,'2005-7-30',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3828','伊予',83600,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3829','西予',64800,'2005-5-31',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
