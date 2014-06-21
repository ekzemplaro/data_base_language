#! /usr/bin/perl
#
#	jquery_perl/create/xml_perl_create.pl
#
#
#						May/20/2011
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	Encode;
use	XML::Simple;
#
use lib '/var/www/data_base/common/perl_common';
use file_io;
use xml_manipulate;
#
# ----------------------------------------------------------------------
my $file_text = "/var/tmp/xml_file/cities.xml";

my %dict_aa = data_prepare_proc ();
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
file_io::string_write_proc ($file_text,encode ('utf-8',$xml_str));
#
print "Content-type: text/html\n\n";
#
print "*** OK ***\n";
# ----------------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t2261','静岡',51200,'2005-2-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2262','浜松',34700,'2005-8-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2263','沼津',58600,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2264','三島',43200,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2265','富士',27100,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2266','熱海',94700,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2267','富士宮',35100,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2268','藤枝',85600,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2269','御殿場',64700,'2005-5-21',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2270','島田',82300,'2005-9-14',%dict_aa);

}

# ----------------------------------------------------------------------
