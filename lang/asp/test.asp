<html>
<head>
<meta http-equiv="Content-Language" content="ja">
<meta http-equiv="Centent-Type" content="text/html";charset=shift_jis">
<title>TEST</title>
<link rel="stylesheet" type="text/css" href="css/style01.css">
<script Language="JavaScript"><!--
moveTo(100,100);
// --></script>
</head>
<body>
<script Language="JavaScript"><!--
	//document.write("幅＝",document.body.clientWidth ," 高さ＝",document.body.clientHeight ,"<br>");
	document.write("<table border=0 cellpadding=0 cellspacing=0 width=100% height=100%>");
	document.write("<tr>");
	document.write("<td align=center valign=center height=", document.body.clientHeight-90 ,">");
	document.write("<img src='/images/lw.jpg' name='img'><br>");
	document.write("</td>");
	document.write("</tr>");
	document.write("<tr>");
	document.write("<td align=center valign=center height=50>");
	document.write("<img src='/images/l_arrow.jpg'>");
	document.write("<img src='/images/r_arrow.jpg'>");
	document.write("</td>");
	document.write("</tr>");
	document.write("</table>");

	if(document.img.width > document.img.height) {
		document.img.width=document.body.clientWidth;
	} else {
		document.img.height=document.body.clientHeight-100;
	}

// --></script>
</body>
</html>
