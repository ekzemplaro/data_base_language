#! /usr/bin/perl
#
#	berkeley_perl_create.pl
#
#					Oct/10/2011
#
# ------------------------------------------------------------
use    strict;
use    warnings;
#
use DB_File
#
print "Content-type: text/html\n\n";
print "*** start ***<p />";
#
my $db_file="/var/tmp/berkeley/cities.db";
unlink ($db_file);
dbmopen (my %dd,$db_file,0644);
#
#
$dd{"t2451"}='{"name": "津","population": 81200,"date_mod": "2005-2-10"}';
$dd{"t2452"}='{"name": "鈴鹿","population": 52500,"date_mod": "2005-4-8"}';
$dd{"t2453"}='{"name": "伊勢","population": 15500,"date_mod": "2005-9-17"}';
$dd{"t2454"}='{"name": "鳥羽","population": 63400,"date_mod": "2005-8-2"}';
$dd{"t2455"}='{"name": "四日市","population": 21200,"date_mod": "2005-5-15"}';
$dd{"t2456"}='{"name": "亀山","population": 92100,"date_mod": "2005-8-17"}';
$dd{"t2457"}='{"name": "尾鷲","population": 82700,"date_mod": "2005-4-12"}';
$dd{"t2458"}='{"name": "桑名","population": 27200,"date_mod": "2005-3-14"}';
$dd{"t2459"}='{"name": "志摩","population": 32100,"date_mod": "2005-12-21"}';
$dd{"t2460"}='{"name": "伊賀","population": 82700,"date_mod": "2005-10-2"}';
$dd{"t2461"}='{"name": "名張","population": 72800,"date_mod": "2005-7-26"}';
$dd{"t2462"}='{"name": "熊野","population": 62100,"date_mod": "2005-10-18"}';
#
dbmclose (%dd);
#
#
print "*** OK ***\n";
#
# ------------------------------------------------------------
