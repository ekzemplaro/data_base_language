#! /usr/bin/perl
#
#	xindice_perl_create.pl
#
#
#						Jul/23/2011
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
my $uri = 'http://cdbd026:8888/xindice/db/cities/cities';
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
		('t0271','青森',75800,'2005-5-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0272','弘前',14200,'2005-7-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0273','八戸',58600,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0274','三沢',46400,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0275','黒石',27100,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0276','むつ',92100,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0277','五所川原',35700,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0278','十和田',85600,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0279','平川',64800,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
