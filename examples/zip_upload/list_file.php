<?php
function list_file ()
{
$updir = "./work_area/";
$rpath= realpath($updir);
$fldr = opendir ($rpath);
$array = array ();
while ($obj = readdir ($fldr))
{
	$llx = strlen ($obj);
	if (2 < $llx)
	{
//	if (mb_substr ($obj,0,1) == "O")
		{
		array_push ($array,$obj);
		}
	}
}

sort ($array);

echo '<table id="file_list">';

foreach ($array as $fname)
{
	echo "<tr>";
	echo "<td>";
	$file_aa = 'work_area/' . $fname;
//	echo $data . '<br />';
	echo '<a href="' . $file_aa . '">' . $fname . '</a>';
	echo "</td>";

	$date_aa = date ("Y-m-d H:i",filemtime ($file_aa));

	$size_aa = round (filesize ($file_aa) / 1024) . "KB";

	echo "<td>" . $size_aa . "</td>";
	echo "<td>" . $date_aa . "</td>";

	echo "</tr>";
}

closedir ($fldr);
echo "</table>";

}
?>
