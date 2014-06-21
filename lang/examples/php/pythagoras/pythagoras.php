#! /usr/bin/php
<?php
// --------------------------------------------------------------------
//	pythagoras.php
//
//						Apr/03/2012
//
// --------------------------------------------------------------------
function print_proc ($xx,$yy,$zz,$aa)
{
	$ratio = $xx / $yy;

	if (! in_array ($ratio,$aa))
		{
		print $xx . "\t";
		print $yy . "\t";
		print $zz . "\t";
		print "ratio = " . $ratio . "\n";

		array_push ($aa,$ratio);
		}

	return	$aa;
}


// --------------------------------------------------------------------
function p01_proc ($xx,$yy,$aa)
{
	$xx2 = $xx * $xx;
	$yy2 = $yy * $yy;
	$xxyy2 = $xx2 + $yy2;
	$zz = (int) (sqrt ($xxyy2));
	$zz2 = $zz * $zz;

	if ($xxyy2 == $zz2)
		{
		$aa = print_proc ($xx,$yy,$zz,$aa);
		}

	return	$aa;
}

// --------------------------------------------------------------------
print "*** 開始 ***\n";
$nmax = 50;
print $nmax . "\n";

$aa = array ();

for ($xx = 1; $xx < $nmax; $xx++)
	{
	for ($yy = $xx + 1; $yy < $nmax; $yy++)
		{
		$aa = p01_proc ($xx,$yy,$aa);
		}
	}

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>

