#! /usr/bin/perl
#
#	jquery_perl/create/exist_perl_create.pl
#
#
#						Jun/12/2012
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	XML::Simple;
#
use	lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use xml_manipulate;
use	uri_get;
#
# ----------------------------------------------------------------------
print "Content-type: text/html\n\n";
#
my $uri = 'http://nlf132:8086/exist/rest/db/cities/cities.xml';
#
my %dict_aa = data_prepare_proc ();
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
#
uri_get::uri_put_proc ($uri,encode ('utf8',$xml_str));
#
#
print "*** OK ***\n";
# ----------------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t4251','長崎',58400,'2005-5-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4252','佐世保',42700,'2005-7-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4253','島原',63900,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4254','大村',46700,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4255','諫早',27100,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4256','五島',92100,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4257','平戸',35700,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4258','雲仙',85600,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4259','松浦',64800,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
