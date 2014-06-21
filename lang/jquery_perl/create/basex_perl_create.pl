#! /usr/bin/perl
#
#	basex_perl_create.pl
#
#
#						Jul/31/2012
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
my $uri = 'http://admin:admin@localhost:8984/rest/cities';
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
		('t4161','佐賀',81700,'2005-10-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4162','唐津',19500,'2005-9-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4163','鳥栖',58600,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4164','多久',46400,'2005-8-25',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4165','伊万里',21900,'2005-2-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4166','武雄',92100,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4167','鹿島',35700,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4168','小城',85600,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4169','嬉野',64800,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
