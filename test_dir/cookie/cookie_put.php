<?php
// ------------------------------------------------------------------
//
//	cookie_put.php
//
$expire = time()+60*60*24*7;
setcookie('message','これはテストです。',$expire);
setcookie('aa','りんご',$expire);
setcookie('bb','ぶどう',$expire);
setcookie('cc','桃',$expire);

echo "<!DOCTYPE html>";
echo "<html lang=\"ja\">";
echo "<body>";

echo "Aug/14/2020<p/>";
echo "</body>";
echo "</html>";
// ------------------------------------------------------------------
?>
