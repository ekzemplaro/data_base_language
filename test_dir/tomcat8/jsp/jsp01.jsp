<%@page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />
<title>JSP のテスト</title>
</head>
<body>

<h1>JSP のテスト</h1>

<%
    String word1 = "Hello World!";
    out.println(word1);
%>
<br />
1 + 1 = <%= 1 + 1 %>
<br />

<%
int count = 0;
for (int it=0; it < 12; it++)
{
count += 1;
}
out.println ("count = " + count + "<br />");
%>
count = <%=count%>
<br />
Jun/29/2016<br />
</body>
</html>
