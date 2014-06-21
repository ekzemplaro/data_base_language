#! /usr/bin/perl
#
use XML::Simple;
use Data::Dumper;
#use strict;

$rData = XMLin('./test01.xml');
print Dumper($rData);
for ($it=0; $it<=$#{$rData->{Member}}; $it++)
	{
	$rMember = $rData->{Member}->[$it];
	foreach my $ele (keys(%{$rMember}))
		{
		print "$it : $ele :",$rMember->{$ele},"\n";
		}
	}
