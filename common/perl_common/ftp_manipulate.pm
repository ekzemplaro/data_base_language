#! /usr/bin/perl
#
#	ftp_manipulate.pm
#
#					Jan/23/2012
# -------------------------------------------------------
package	ftp_manipulate;
# -------------------------------------------------------
use	strict;
use	warnings;
#
use	utf8;
use	Encode;
#
use Net::FTP;
#
use file_io;
#
# -------------------------------------------------------
sub ftp_read_proc
{
	my ($host,$user,$passwd,$path) = @_;
	my $ftp = Net::FTP->new($host);
	$ftp->login ($user,$passwd);
#
	my $tmp_json = '/tmp/tmp_ftp.json';
	$ftp->get ($path,$tmp_json);
	$ftp->quit;
#
	my $str_json = file_io::string_read_proc ($tmp_json);
#
	unlink ($tmp_json);
#
	return	$str_json;
}
# -------------------------------------------------------
1;
# -------------------------------------------------------
