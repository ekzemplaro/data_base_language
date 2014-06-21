#! /usr/bin/perl
#
#	jquery_perl/create/gdbm_perl_create.pl
#
#
#						Jan/11/2011
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
#
#
# ----------------------------------------------------------------------
my $db_file="/var/tmp/gdbm/cities";
#
dbmopen (my %dd,$db_file,0644) || die "cannot open DBM";
#
$dd{"t2151"}='{"name": "岐阜","population": 74800,"date_mod": "2005-9-21"}';
$dd{"t2152"}='{"name": "大垣","population": 42300,"date_mod": "2005-8-8"}';
$dd{"t2153"}='{"name": "多治見","population": 27200,"date_mod": "2005-6-4"}';
$dd{"t2154"}='{"name": "各務原","population": 74600,"date_mod": "2005-8-02"}';
$dd{"t2155"}='{"name": "土岐","population": 21500,"date_mod": "2005-5-21"}';
$dd{"t2156"}='{"name": "高山","population": 32100,"date_mod": "2005-10-12"}';
$dd{"t2157"}='{"name": "美濃加茂","population": 73400,"date_mod": "2005-11-21"}';
$dd{"t2158"}='{"name": "恵那","population": 42300,"date_mod": "2005-10-15"}';
$dd{"t2159"}='{"name": "関","population": 62700,"date_mod": "2005-12-21"}';
$dd{"t2160"}='{"name": "中津川","population": 53400,"date_mod": "2005-10-17"}';
#
#
dbmclose (%dd);
#
print "Content-type: text/html\n\n";
#
print "*** OK ***\n";
# ----------------------------------------------------------------------
