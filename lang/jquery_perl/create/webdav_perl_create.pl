#! /usr/bin/perl
#
#	webdav_perl_create.pl
#
#						Mar/13/2013
#
# -------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use LWP::UserAgent;
use	Encode;
use	JSON;
#
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use uri_get;
#
# -------------------------------------------------------------
my $uri = 'http://host_dbase:3004/city/tokyo.json';
#
print "Content-type: text/html\n\n";
print "*** webdav_perl_create.pl *** start ***<p />";
#
my %dict_aa = data_prepare_proc ();
#
my $json_str = encode_json (\%dict_aa);
#
#
uri_get::uri_put_proc ($uri,$json_str);
#
#
print "*** OK ***<br>";
#
# -------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;

	%dict_aa = text_manipulate::dict_append_proc
		('t1351','八王子',58900,'2005-3-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1352','立川',42300,'2005-7-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1353','武蔵野',58600,'2005-4-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1354','三鷹',46400,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1355','青梅',27100,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1356','府中',13600,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1357','昭島',35400,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1358','調布',85600,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1359','町田',64700,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# -------------------------------------------------------------
