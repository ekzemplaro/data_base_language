#! /usr/bin/perl
#
#	jquery_perl/create/cdb_perl_create.pl
#
#
#						May/29/2013
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	JSON;
use	Encode;
use	CDB_File;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
#
# ----------------------------------------------------------------------
my $file_cdb = "/var/tmp/cdb/cities.cdb";

my %dict_aa = data_prepare_proc ();
#
unlink "$file_cdb" if -e "$file_cdb";
my $cdb = new CDB_File ("$file_cdb", "$file_cdb.$$") or die;
#
foreach my $key (sort keys %dict_aa){
	my $data = $dict_aa{$key};
	my $json_str = encode_json ($data);
	$cdb->insert($key,$json_str);
	}

$cdb->finish;
#
chmod 0666, $file_cdb;
#
print "Content-type: text/html\n\n";
#
print "*** OK ***\n";
# ----------------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;

	%dict_aa = text_manipulate::dict_append_proc
		('t2761','豊中',84200,'2005-8-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2762','池田',78300,'2005-2-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2763','高槻',51700,'2005-7-27',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2764','吹田',43200,'2005-9-2',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2765','茨木',27900,'2005-2-18',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2766','摂津',92300,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2767','泉大津',39200,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2768','和泉',85200,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2769','高石',82600,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
