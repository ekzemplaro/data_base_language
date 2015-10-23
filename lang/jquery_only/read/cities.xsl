<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="4.0" encoding="utf-8"
		indent="yes" media-type="text/html" />
<xsl:template match="/">
<table border="1">
<caption>
日本の都市</caption>
<tr>
<th colspan="4" align="center">一覧表</th>
</tr>
<tr>
		<th>ID</th>
		<th>都市名</th>
		<th>人口</th>
		<th>改訂日</th>
</tr>
<xsl:for-each select="root/cities">
	<tr>
		<td><xsl:value-of select="id" /></td>
		<td><xsl:value-of select="name" /></td>
		<td><xsl:value-of select="population" /></td>
		<td><xsl:value-of select="date_mod" /></td>
		</tr>
</xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>
