#! /usr/bin/perl
#
#	read/berkeley_read.pl
#
#					Jan/06/2015
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	JSON;
use	DB_File;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
# ----------------------------------------------------------------
sub db_to_dict_proc
{
	my  ($db_file) = @_;
	dbmopen(my %dd_in,$db_file,0644);

	my %dict_aa;

	foreach my $key (keys %dd_in)
	{
	my $json_str = $dd_in{$key};
#

	$dict_aa{$key} = decode_json ($json_str);
	}

	dbmclose (%dd_in);

	return	%dict_aa;
}

# ----------------------------------------------------------------
#
print "*** 開始 ***\n";
#
my $db_file= $ARGV[0];
#
my %dict_aa = db_to_dict_proc ($db_file);
#
text_manipulate::dict_display_proc (%dict_aa);
#
print ("*** 終了 ***\n");
# ----------------------------------------------------------------
