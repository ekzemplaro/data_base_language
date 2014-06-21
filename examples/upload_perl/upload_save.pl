#! /usr/bin/perl

use	strict;
use	utf8;
use	warnings;
use	CGI;
use	File::Copy;

# --------------------------------------------------------------------
my $SAVE_DIR = '/tmp';

my $q = CGI->new;
my @files = $q->param ('files');
for my $filename (@files)
{
	copy($q->tmpFileName($filename), "$SAVE_DIR/$filename") or die $!;
}

print "Content-type: text/html\n\n";
print	"Data is saved<br />";
#
exit;

# --------------------------------------------------------------------
