#! /usr/bin/perl
#
#	berkeley_read.pl
#
#					Apr/09/2010
#
#
# ----------------------------------------------------------------
use JSON::Syck;
use DB_File
#
print "*** start ***\n";
#
# $db_file="cities.db";
$db_file="/var/tmp/berkeley/cities.db";
dbmopen(%dd,$db_file,0644);
#
foreach $key (keys %dd)
{
	$out_str = $dd{$key};
	my $data=JSON::Syck::Load ($out_str);
	@fields = split (/,/,$out_str);
	$name = $data->{name};
	$population = $data->{population};
	$date_mod = $data->{date_mod};
#
	print $key . "\t";
	print $name . "\t";
	print $population . "\t";
	print $date_mod . "\n";

}
#
dbm.close (%dd);
#
#
print	"*** end ***\n";
# ----------------------------------------------------------------
sub henkan_proc
{
	my $str_in = @_[0];
	my @nnx = split (/:/,$str_in);
	my $str_out = $nnx[1]; 
	$str_out =~ s/\"//g;
	$str_out =~ s/\}//;

	return	$str_out;
}

# ----------------------------------------------------------------
