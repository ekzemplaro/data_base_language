#! /usr/bin/perl
#
#	gdbm_create.pl
#
#					Jun/11/2015
#
# ------------------------------------------------------------
use	strict;
use	warnings;

use lib '/var/www/data_base/common/perl_common';
# use kvalue_manipulate;
# use text_manipulate;
#
#
# ------------------------------------------------------------
my $db_file= $ARGV[0];
#
print	"*** 開始 ***\n";
#
unlink ($db_file .".dir");
unlink ($db_file .".pag");
#
dbmopen (my %dd,$db_file,0666) || die "cannot open DBM";
#
$dd{"t2151"}='{"name": "岐阜","population": 71285,"date_mod": "2005-5-17"}';
$dd{"t2152"}='{"name": "大垣","population": 32976,"date_mod": "2005-7-21"}';
$dd{"t2153"}='{"name": "多治見","population": 26715,"date_mod": "2005-6-4"}';
$dd{"t2154"}='{"name": "各務原","population": 74632,"date_mod": "2005-8-2"}';
$dd{"t2155"}='{"name": "土岐","population": 21734,"date_mod": "2005-5-21"}';
$dd{"t2156"}='{"name": "高山","population": 38195,"date_mod": "2005-10-12"}';
$dd{"t2157"}='{"name": "美濃加茂","population": 82764,"date_mod": "2005-11-21"}';
$dd{"t2158"}='{"name": "恵那","population": 48567,"date_mod": "2005-10-11"}';
$dd{"t2159"}='{"name": "関","population": 67931,"date_mod": "2005-11-25"}';
$dd{"t2160"}='{"name": "中津川","population": 89134,"date_mod": "2005-12-4"}';
#
# kvalue_manipulate::kvalue_display_proc (%dd);
#
#
dbmclose (%dd);
#
chmod (0666,$db_file .".dir");
chmod (0666,$db_file .".pag");
#
print	"*** 終了 ***\n";
#
# ------------------------------------------------------------
